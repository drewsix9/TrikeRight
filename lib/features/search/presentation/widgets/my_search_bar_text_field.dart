import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';

class MySearchBarTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const MySearchBarTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        style: AppTextLightTheme
            .searchBarTextFieldAndTextFieldToSearchAndTextField,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
          filled: true,
          fillColor: const Color(0xFFE8EDF4),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF5E758C),
          ),
          hintText: hintText,
          hintStyle: AppTextLightTheme
              .searchBarTextFieldAndTextFieldToSearchAndTextFieldHintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
