import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      // AppBar - Trike Right
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'History',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF0F1416),
            fontSize: 18.sp,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFFF7FAFC),
      ),
      // Sliding Up Panel
      body: MyListViewBuilder().redacted(context: context, redact: true),
      // Bottom Navigation Bar
    );
  }
}
