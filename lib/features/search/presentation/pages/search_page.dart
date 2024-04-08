import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/features/search/presentation/widgets/my_auto_complete_text_form_field.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  const SearchPage({super.key, required this.searchTextEditingController});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get searchTextEditingController => widget.searchTextEditingController;

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
                      onChanged: (value) {}))
            ],
          ),
        ),
      ),
    );
  }
}
