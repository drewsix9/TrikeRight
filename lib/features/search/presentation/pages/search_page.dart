import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/features/search/data/network_utility.dart';
import 'package:trikeright/features/search/presentation/widgets/my_auto_complete_list_tile.dart';
import 'package:trikeright/features/search/presentation/widgets/my_auto_complete_text_form_field.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  const SearchPage({super.key, required this.searchTextEditingController});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get searchTextEditingController => widget.searchTextEditingController;

  final String googleApiKey = dotenv.env['GOOGLE_API_KEY']!;

  void placeAutoComplete(String query) async {
    Uri uri =
        Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
      'input': query,
      'key': googleApiKey,
    });
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      print(response);
    }
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: MyAutoCompleteTextFormField(
                      hintText: 'Search for a Place',
                      controller: searchTextEditingController,
                      onChanged: (value) {}),
                ),
                MyAutoCompleteListTile(
                  location: 'Jakarta, Indonesia',
                  onTap: () {},
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              placeAutoComplete("Tagbilaran");
            },
            child: const Icon(Icons.search),
          )),
    );
  }
}
