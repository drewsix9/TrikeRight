import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Plus Jakarta Sans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF7FAFC),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFF7FAFC),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFF7FAFC),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 1,
      color: Color(0xFFF7FAFC),
      shadowColor: Color(0xFFF7FAFC),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF3575AA),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Plus Jakarta Sans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF7FAFC),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFF7FAFC),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFF7FAFC),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 1,
      color: Color(0xFFF7FAFC),
      shadowColor: Color(0xFFF7FAFC),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF3575AA),
    ),
  );
}

class AppTextLightTheme {
  AppTextLightTheme._();

  // lets get started with your account
  static TextStyle titleLarge = TextStyle(
    color: Colors.white,
    fontSize: 28.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
    height: 1.4.h,
    letterSpacing: -0.70,
  );

  static TextStyle labelTextField = TextStyle(
    color: const Color(0xFF0C141C),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle searchBarTextFieldAndTextFieldToSearchAndTextField =
      TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
    height: 1.h,
  );

  static TextStyle searchBarTextFieldAndTextFieldToSearchAndTextFieldHintText =
      TextStyle(
    color: const Color(0xFF5E758C),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
    height: 1.h,
  );

  static TextStyle singleChoiceChipsTextStyle = TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 14.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle trikeRightAppBarTitle = TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 18.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle slidingUpPanelPassengerType = TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 18.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
    height: 0.07,
    letterSpacing: -0.27,
  );

  static TextStyle estimateFareDialogBoxSummaryLuggageAndCargoWeight =
      TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle estimateFareDialogBoxSourceDestinationDistanceBaseRate =
      TextStyle(
    color: const Color(0xFF3575AA),
    fontSize: 14.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle estimateFareDialogBoxSourceDestinationDistanceBaseRateBlack =
      TextStyle(
    color: const Color(0xFF0A141F),
    fontSize: 14.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle luggageAndCargoWeightSingleChoiceChips = TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 14.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle elevatedButtonTextStyle = TextStyle(
    color: const Color(0xFFF7F9FC),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle yourFareIs = TextStyle(
    color: const Color(0xFF0C141C),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle totalFare = TextStyle(
    color: const Color(0xFF0F1416),
    fontSize: 32.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle listViewBuilderTitle = TextStyle(
    color: const Color(0xFF0C141C),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle listViewBuilderSubtitle = TextStyle(
    color: const Color(0xFF49779B),
    fontSize: 14.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );
  static TextStyle listViewBuilderTrailing = TextStyle(
    color: const Color(0xFF0C141C),
    fontSize: 16.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle navBarButton = TextStyle(
    color: const Color(0xFF5E758C),
    fontSize: 12.sp,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.18.w,
  );
}
