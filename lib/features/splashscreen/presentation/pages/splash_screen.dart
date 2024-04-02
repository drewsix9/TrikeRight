import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      SharedPreferences.getInstance().then((prefs) {
        if (prefs.getBool('isFirstTime') == null) {
          prefs.setBool('isFirstTime', true);
          Navigator.of(context).pushReplacementNamed('/user_setup');
        } else {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              Color.fromARGB(255, 18, 94, 156),
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
