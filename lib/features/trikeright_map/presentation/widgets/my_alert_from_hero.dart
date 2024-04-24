import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/const/fare_rates.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/trikeright_map/domain/calculate_fare_model.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';

class MyAlertFromHero extends StatefulWidget {
  const MyAlertFromHero({super.key});

  @override
  State<MyAlertFromHero> createState() => _MyAlertFromHeroState();
}

class _MyAlertFromHeroState extends State<MyAlertFromHero> {
  CalculateFareModel _createCalculateFareModel() {
    var routeResponseApiModelProvider =
        Provider.of<RouteResponseProvider>(context);
    var textEditingControllerProvider =
        Provider.of<TextEditingControllerProvider>(context);
    var passengerTypeProvider = Provider.of<PassengerTypeProvider>(context);
    return CalculateFareModel(
      source: textEditingControllerProvider.sourceController.text,
      destination: textEditingControllerProvider.destinationController.text,
      baseFare: '0',
      totalDistance: routeResponseApiModelProvider
          .routeResponseApiModel.features![0].properties!.summary!.distance!,
      totalDuration: routeResponseApiModelProvider
          .routeResponseApiModel.features![0].properties!.summary!.duration!,
      passengerType: passengerTypeProvider.passengerType!,
    );
  }

  @override
  Widget build(BuildContext context) {
    var calculateFareModel = _createCalculateFareModel();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: 'alert-from-hero',
          // createRectTween: (begin, end) {
          //   return CustomRectTween(begin: begin, end: end);
          // },
          child: _buildPopUpDialog(calculateFareModel),
        ),
      ),
    );
  }

  Material _buildPopUpDialog(CalculateFareModel calculateFareModel) {
    return Material(
      color: const Color(0xFFF7FAFC),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
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
                        SizedBox(width: 18.w),
                        Flexible(
                          child: Text(
                            calculateFareModel.source,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: const Color(0xFF0A141F),
                              fontSize: 14.sp,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                            ),
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
                        SizedBox(width: 18.w),
                        Flexible(
                          child: Text(
                            calculateFareModel.destination,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: const Color(0xFF0A141F),
                              fontSize: 14.sp,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                            ),
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
                        SizedBox(width: 18.w),
                        Text(
                          calculateFareModel.totalDistance > 1000
                              ? '${(calculateFareModel.totalDistance / 1000).toStringAsFixed(2)} km'
                              : '${calculateFareModel.totalDistance} m',
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
                        SizedBox(width: 18.w),
                        Consumer<PassengerTypeProvider>(
                          builder: (context, value, child) => Text(
                            value.passengerType == PassengerType.regular
                                ? '₱${fareRates['Regular']?.toStringAsFixed(2)}'
                                : value.passengerType ==
                                        PassengerType.studentSeniorPWD
                                    ? '₱${fareRates['StudentSeniorPWD']?.toStringAsFixed(2)}'
                                    : '₱${fareRates['Below5']?.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: const Color(0xFF0A141F),
                              fontSize: 14.sp,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 72.h,
                    width: 390.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 16.w,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1C91F2),
                          minimumSize: Size(390.w, 56.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Calculate Fare',
                          style: TextStyle(
                            color: const Color(0xFFF7F9FC),
                            fontSize: 16.sp,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
