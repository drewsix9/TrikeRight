import 'package:flutter/material.dart';
import 'package:trikeright/features/persistent_nav_bar/presentation/pages/persistent_nav_bar.dart';
import 'package:trikeright/features/search/presentation/pages/search_page.dart';
import 'package:trikeright/features/splashscreen/presentation/pages/splash_screen.dart';
import 'package:trikeright/features/trikeright_map/presentation/pages/trikeright_map_page.dart';
import 'package:trikeright/features/user_setup/presentation/pages/user_setup_page.dart';

class AppRouting {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (context) => const SplashScreen(),
    '/user_setup': (context) => const UserSetupPage(),
    '/trikeright_map': (context) => const TrikeRightMapPage(),
    '/persistent_nav_bar': (context) => const PersistentNavBar(),
    '/search_page': (context) {
      final textEditingController =
          ModalRoute.of(context)?.settings.arguments as TextEditingController;
      return SearchPage(
        searchTextEditingController: textEditingController,
      );
    },
  };
}
