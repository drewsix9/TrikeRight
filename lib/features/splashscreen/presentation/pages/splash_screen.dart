import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';

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
    // Set the system ui mode to immersive
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Initialize the passenger type shared pref
    Provider.of<PassengerTypeProvider>(context, listen: false)
        .initPassengerTypeSharedPref();

    // Delay for 3 seconds before navigating to the next page
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the user is a first time user
      SharedPreferences.getInstance().then((prefs) {
        if (prefs.getBool('isFirstTime') == null ||
            prefs.getBool('isFirstTime') == true) {
          Navigator.of(context).pushReplacementNamed('/user_setup');
        } else {
          Navigator.of(context).pushReplacementNamed('/persistent_nav_bar');
        }
      });
    });
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
