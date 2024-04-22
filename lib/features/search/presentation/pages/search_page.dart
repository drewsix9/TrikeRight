import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/openrouteservice_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  const SearchPage({super.key, required this.searchTextEditingController});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get searchTextEditingController => widget.searchTextEditingController;

  bool isLoading = false;
  Timer? _debounceTimer;
  List<ACFeature> suggestionsReponse = [];

  Future<void> getAutoCompleteData(String controllerText) async {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      var response = await http
          .get(OpenRouteServiceApi.getAutoCompleteUrl(controllerText));

      if (mounted) {
        setState(() {
          isLoading = false;
          if (response.statusCode == 200) {
            var autoCompleteResponseApiModel =
                autoCompleteResponseApiModelFromJson(response.body);
            debugPrint(
              autoCompleteResponseApiModelToJson(
                autoCompleteResponseApiModel,
              ),
            );
            suggestionsReponse = autoCompleteResponseApiModel.features!;
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    searchTextEditingController.addListener(() {
      getAutoCompleteData(searchTextEditingController.text);
    });
  }

  void _handleListItemTap(BuildContext context, ACFeature selectedFeature) {
    final TextEditingController sourceController =
        Provider.of<TextEditingControllerProvider>(context, listen: false)
            .sourceController;
    final TextEditingController destinationController =
        Provider.of<TextEditingControllerProvider>(context, listen: false)
            .destinationController;

    final FeatureProvider featureProvider =
        Provider.of<FeatureProvider>(context, listen: false);

    if (sourceController == widget.searchTextEditingController) {
      featureProvider.setSourceFeature(selectedFeature);
    } else if (destinationController == widget.searchTextEditingController) {
      featureProvider.setDestinationFeature(selectedFeature);
    }

    widget.searchTextEditingController.text = selectedFeature.properties!.name!;
    suggestionsReponse.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7FAFC),
        resizeToAvoidBottomInset: false,
        // AppBar - Search Page
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: TextFormField(
                controller: searchTextEditingController,
                autofocus: true,
                onChanged: ((value) => getAutoCompleteData(value)),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
                  filled: true,
                  fillColor: const Color(0xFFE8EDF4),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF5E758C),
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
                  hintStyle: TextStyle(
                    color: const Color(0xFF5E758C),
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.h,
                  ),
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
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: suggestionsReponse.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(suggestionsReponse[index].properties!.name!),
                          onTap: () {
                            _handleListItemTap(
                              context,
                              suggestionsReponse[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
