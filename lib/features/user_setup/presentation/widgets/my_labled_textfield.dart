import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';

class MyLabelTextField extends StatelessWidget {
  final String label;

  const MyLabelTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: SizedBox(
        width: 358.w,
        height: 24.h,
        child: Text(
          label,
          style: AppTextTheme.labelTextField,
        ),
      ),
    );
  }
}
