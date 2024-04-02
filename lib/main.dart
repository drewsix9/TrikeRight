import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';
import 'package:trikeright/features/user_setup/presentation/pages/user_setup_page.dart';
import 'package:trikeright/routing/app_routing.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PassengerTypeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        routes: AppRouting.routes,
        debugShowCheckedModeBanner: false,
        title: 'TrikeRight',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const UserSetupPage(),
      ),
    );
  }
}
