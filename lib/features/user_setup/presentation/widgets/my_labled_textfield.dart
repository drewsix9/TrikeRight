import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: TextStyle(
            color: const Color(0xFF0C141C),
            fontSize: 16.sp,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
