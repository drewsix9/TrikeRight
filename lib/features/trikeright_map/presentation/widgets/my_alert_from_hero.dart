import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAlertFromHero extends StatelessWidget {
  const MyAlertFromHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: 'alert-from-hero',
          // createRectTween: (begin, end) {
          //   return CustomRectTween(begin: begin, end: end);
          // },
          child: Material(
            color: const Color(0xFFF7FAFC),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            children: [
                              Text(
                                'Source:',
                                style: TextStyle(
                                  color: const Color(0xFF3575AA),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 24.w),
                              Text(
                                'Current Location',
                                style: TextStyle(
                                  color: const Color(0xFF0A141F),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            children: [
                              Text(
                                'Destination:',
                                style: TextStyle(
                                  color: const Color(0xFF3575AA),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 24.w),
                              Text(
                                'Chosen Destination',
                                style: TextStyle(
                                  color: const Color(0xFF0A141F),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            children: [
                              Text(
                                'Distance:',
                                style: TextStyle(
                                  color: const Color(0xFF3575AA),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 24.w),
                              Text(
                                '3.5 km',
                                style: TextStyle(
                                  color: const Color(0xFF0A141F),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            children: [
                              Text(
                                'Base Rate:',
                                style: TextStyle(
                                  color: const Color(0xFF3575AA),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 24.w),
                              Text(
                                '\$2.00',
                                style: TextStyle(
                                  color: const Color(0xFF0A141F),
                                  fontSize: 14.sp,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
