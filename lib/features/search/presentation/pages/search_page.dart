import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: TextFormField(
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
            )
          ],
        ),
      ),
    );
  }
}
