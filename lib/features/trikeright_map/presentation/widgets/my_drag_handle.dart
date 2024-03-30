import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDragHandle extends StatelessWidget {
  const MyDragHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 20.h,
      decoration: const BoxDecoration(color: Color(0xFFF7FAFC)),
      child: Center(
        child: Container(
          width: 36.w,
          height: 4.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFD8E0E8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.r)),
          ),
        ),
      ),
    );
  }
}
