import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  final TextInputAction textInputAction;

  const MyTextFormField({
    super.key,
    required AutovalidateMode autovalidateMode,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8, bottom: 8.h),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        style: AppTextTheme.searchBarTextFieldAndTextFieldToSearchAndTextField,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextTheme
              .searchBarTextFieldAndTextFieldToSearchAndTextFieldHintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
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
