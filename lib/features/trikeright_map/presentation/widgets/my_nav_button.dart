import 'package:flutter/material.dart';

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
      width: 114,
      height: 54,
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
            style: const TextStyle(
              color: Color(0xFF5E758C),
              fontSize: 12,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.18,
            ),
          )
        ],
      ),
    );
  }
}
