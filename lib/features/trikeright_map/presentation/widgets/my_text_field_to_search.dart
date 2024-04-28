import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';

class MyTextFieldToSearch extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function()? onTap;

  const MyTextFieldToSearch({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        readOnly: true,
        onTap: onTap,
        keyboardType: keyboardType,
        controller: controller,
        style: AppTextTheme.searchBarTextFieldAndTextFieldToSearchAndTextField,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextTheme
              .searchBarTextFieldAndTextFieldToSearchAndTextFieldHintText,
          filled: true,
          fillColor: const Color(0xFFE8EDF4),
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
