import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyElevatedButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const MyElevatedButton(
      {super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      width: 390.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1C91F2),
            minimumSize: Size(390.w, 56.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              color: const Color(0xFFF7F9FC),
              fontSize: 16.sp,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
