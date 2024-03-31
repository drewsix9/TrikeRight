import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_nav_button.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      height: 75.h,
      color: const Color(0xFFF7FAFC),
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 6.h, top: 4.h),
        child: Container(
          width: 358.w,
          height: 54.h,
          color: const Color(0xFFF7FAFC),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyNavButton(
                icon: Icons.route,
                label: 'Route',
              ),
              MyNavButton(
                icon: Icons.history,
                label: 'History',
              ),
              MyNavButton(
                icon: Icons.settings,
                label: 'Preferences',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
