import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // Let's get started with your account
    headlineMedium: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 28.sp,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w700,
      height: 0.04.h,
      letterSpacing: -0.70,
    ),
    // Full Name, Mobile number
    bodyMedium: const TextStyle().copyWith(
      color: const Color(0xFF0C141C),
      fontSize: 16.sp,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w500,
      height: 0.09.h,
    ),
  );
  static TextTheme darkTextTheme = const TextTheme();
}
