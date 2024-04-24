import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAutoCompleteTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;

  const MyAutoCompleteTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
        filled: true,
        fillColor: const Color(0xFFE8EDF4),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF5E758C),
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                color: const Color(0xFF5E758C),
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
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
    );
  }
}
