import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Plus Jakarta Sans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF7FAFC),
    // textTheme: AppTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData();
}
