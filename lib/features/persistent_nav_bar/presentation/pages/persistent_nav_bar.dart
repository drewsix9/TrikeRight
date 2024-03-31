import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trikeright/features/history/presentation/pages/history_page.dart';
import 'package:trikeright/features/preference/presentation/pages/preference_page.dart';
import 'package:trikeright/features/trikeright_map/presentation/pages/trikeright_map_page.dart';

class PersistentNavBar extends StatefulWidget {
  const PersistentNavBar({super.key});

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: [
        PersistentTabConfig(
          screen: const TrikeRightMapPage(),
          item: ItemConfig(
            icon: const Icon(Icons.route),
            title: "Route",
          ),
        ),
        PersistentTabConfig(
          screen: const HistoryPage(),
          item: ItemConfig(
            icon: const Icon(Icons.history),
            title: "History",
          ),
        ),
        PersistentTabConfig(
          screen: const PreferencePage(),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Preferences",
          ),
        ),
      ],
      navBarHeight: 75.h,
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: const Color(0xFFF7FAFC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
          ),
        ),
      ),
    );
  }
}
