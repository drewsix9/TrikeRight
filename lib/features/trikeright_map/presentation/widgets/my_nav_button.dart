import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';

class MyNavButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const MyNavButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114.w,
      height: 54.h,
      color: const Color(0xFFF7FAFC),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF5E758C),
            size: 24,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextLightTheme.navBarButton,
          ),
        ],
      ),
    );
  }
}
