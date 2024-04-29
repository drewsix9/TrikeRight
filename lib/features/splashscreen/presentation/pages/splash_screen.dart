import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1C91F2),
              Color(0xFF0D5C9D),
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SizedBox(
            width: 350.w,
            child: Image.asset(
              'lib/features/splashscreen/presentation/utils/images/Color logo - no background.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
