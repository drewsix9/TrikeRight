import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';
import 'package:trikeright/features/search/data/suggestion_response_provider.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openrouteservice_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  const SearchPage({super.key, required this.searchTextEditingController});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get searchTextEditingController => widget.searchTextEditingController;
  late SuggestionsResponseProvider suggestionResponseProvider;
  late TextEditingController sourceController;
  late TextEditingController destinationController;
  late FeatureProvider featureProvider;

  bool isGettingSuggestions = false;
  bool isGettingLocation = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    searchTextEditingController.addListener(() {
      _getAutoCompleteData(searchTextEditingController.text);
    });
    suggestionResponseProvider = context.read<SuggestionsResponseProvider>();
    sourceController =
        context.read<TextEditingControllerProvider>().sourceController;
    destinationController =
        context.read<TextEditingControllerProvider>().destinationController;
    featureProvider = context.read<FeatureProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      resizeToAvoidBottomInset: false,
      // AppBar - Search Page
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: TextFormField(
              controller: searchTextEditingController,
              autofocus: true,
              onChanged: ((value) => _getAutoCompleteData(value)),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
                filled: true,
                fillColor: const Color(0xFFE8EDF4),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.my_location_rounded,
                    color: CupertinoColors.activeBlue,
                  ),
                  onPressed: () {
                    _determinePosition(context);
                  },
                ),
                suffixIcon: searchTextEditingController.text.isEmpty
                    ? null
                    : IconButton(
                        color: const Color(0xFF5E758C),
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchTextEditingController.clear();
                        },
                      ),
                hintText: 'Search for a place',
                hintStyle: AppTextLightTheme
                    .searchBarTextFieldAndTextFieldToSearchAndTextFieldHintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
          (isGettingSuggestions || isGettingLocation)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount:
                        suggestionResponseProvider.suggestionsReponse.length,
                    itemBuilder: (context, index) {
                      return suggestionResponseProvider
                              .suggestionsReponse.isEmpty
                          ? const Center(
                              child: Text('No Results Found'),
                            )
                          : ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 24.w),
                              title: Text(suggestionResponseProvider
                                  .suggestionsReponse[index].properties!.name!),
                              onTap: () {
                                _handleListItemTap(
                                  context,
                                  suggestionResponseProvider
                                      .suggestionsReponse[index],
                                );
                              },
                            );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  void _handleListItemTap(BuildContext context, ACFeature selectedFeature) {
    if (sourceController == widget.searchTextEditingController) {
      suggestionResponseProvider.sourceHasSelected = true;
      featureProvider.setSourceFeature(selectedFeature);
    } else if (destinationController == widget.searchTextEditingController) {
      suggestionResponseProvider.destinationHasSelected = true;
      featureProvider.setDestinationFeature(selectedFeature);
    }

    widget.searchTextEditingController.text = selectedFeature.properties!.name!;
    suggestionResponseProvider.clearSuggestionsReponse();
    Navigator.of(context).pop();
  }

  Future<void> _getAutoCompleteData(String controllerText) async {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (mounted) {
        setState(() {
          isGettingSuggestions = true;
        });
      }
      var response = await http
          .get(OpenRouteServiceApi.getAutoCompleteUrl(controllerText));

      if (mounted) {
        setState(() {
          isGettingSuggestions = false;
          if (response.statusCode == 200) {
            var autoCompleteResponseApiModel =
                autoCompleteResponseApiModelFromJson(response.body);
            Log.i(autoCompleteResponseApiModel.toString());
            suggestionResponseProvider.suggestionsReponse =
                autoCompleteResponseApiModel.features!;
          }
        });
      }
    });
  }

  Future<Position?> _determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    setState(() {
      isGettingLocation = true;
    });

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      Log.i(place.toString());
      Log.i(position.toString());

      setState(() {
        widget.searchTextEditingController.text =
            "${place.street}, ${place.thoroughfare}, ${place.locality}";
      });
    } catch (e) {
      Log.e(e);
    }

    final generatedFeaturefromGeoCoding = ACFeature(
        geometry: Geometry(
      coordinates: [position.longitude, position.latitude],
    ));

    if (sourceController == widget.searchTextEditingController) {
      featureProvider.setSourceFeature(generatedFeaturefromGeoCoding);
      suggestionResponseProvider.sourceHasSelected = true;
    } else if (destinationController == widget.searchTextEditingController) {
      featureProvider.setDestinationFeature(generatedFeaturefromGeoCoding);
      suggestionResponseProvider.destinationHasSelected = true;
    }

    if (context.mounted) {
      Navigator.of(context).pop();
    }

    setState(() {
      isGettingLocation = false;
    });

    return null;
  }
}
