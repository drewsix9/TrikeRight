import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/const/fare_luggage_rates.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/history/data/history_list_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/trikeright_map/domain/calculate_fare_helper.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';

class MyAlertFromHero extends StatefulWidget {
  const MyAlertFromHero({super.key});

  @override
  State<MyAlertFromHero> createState() => _MyAlertFromHeroState();
}

class _MyAlertFromHeroState extends State<MyAlertFromHero> {
  List<String> luggageOptions = ['None', '10-25 kgs.', '25-50 kgs'];
  int chosenLuggageIndex = 0;

  HistoryItem _createHistoryItem() {
    var routeResponseApiModelProvider =
        Provider.of<RouteResponseProvider>(context);
    var textEditingControllerProvider =
        Provider.of<TextEditingControllerProvider>(context);
    var passengerTypeProvider = Provider.of<PassengerTypeProvider>(context);
    return HistoryItem(
      source: textEditingControllerProvider.sourceController.text,
      destination: textEditingControllerProvider.destinationController.text,
      distance: routeResponseApiModelProvider
          .routeResponseApiModel!.features![0].properties!.summary!.distance!,
      duration: routeResponseApiModelProvider
          .routeResponseApiModel!.features![0].properties!.summary!.duration!,
      passengerType: passengerTypeProvider.passengerType!,
      baseRate: passengerTypeToBaseRate(passengerTypeProvider.passengerType!),
      luggageCost: luggageRates[chosenLuggageIndex],
    );
  }

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
          child: _buildPopUpDialog(),
        ),
      ),
    );
  }

  Material _buildPopUpDialog() {
    var historyItem = _createHistoryItem();
    var historyListProvider = Provider.of<HistoryListProvider>(context);
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
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Summary',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF0F1416),
                            fontSize: 16.sp,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Color(0xFF0F1416),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
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
                            historyItem.source,
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
                    padding: EdgeInsets.symmetric(vertical: 8.h),
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
                            historyItem.destination,
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
                    padding: EdgeInsets.symmetric(vertical: 12.h),
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
                          historyItem.distance > 1000
                              ? '${(historyItem.distance / 1000).toStringAsFixed(2)} km'
                              : '${historyItem.distance} m',
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
                    padding: EdgeInsets.symmetric(vertical: 12.h),
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
                        Text(
                          historyItem.baseRate.toStringAsFixed(2),
                          style: TextStyle(
                            color: const Color(0xFF0A141F),
                            fontSize: 14.sp,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        chosenLuggageIndex == 0
                            ? const SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(
                                  '+ ₱${luggageRates[chosenLuggageIndex].toStringAsFixed(2)}',
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
                  const Divider(thickness: 1),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        'Luggage and Cargo Weight',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color(0xFF0F1416),
                          fontSize: 16.sp,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  ChipsChoice.single(
                    padding: EdgeInsets.zero,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    value: chosenLuggageIndex,
                    // wrapped: true,
                    onChanged: (val) => {
                      setState(() {
                        chosenLuggageIndex = val;
                      })
                    },
                    choiceItems: C2Choice.listFrom(
                      source: luggageOptions,
                      value: (i, v) => i,
                      label: (i, v) => v,
                    ),
                    choiceStyle: C2ChipStyle.toned(
                      padding: EdgeInsets.only(left: 8.w),
                      height: 22.h,
                      foregroundStyle: TextStyle(
                        color: const Color(0xFF0F1416),
                        fontSize: 14.sp,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                    ),
                    choiceCheckmark: true,
                  ),
                  SizedBox(
                    height: 72.h,
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
                        onPressed: () {
                          var newHistoryItem = historyItem.copyWith(
                            luggageCost: luggageRates[chosenLuggageIndex],
                            total: calculateTotalFare(historyItem),
                          );
                          historyListProvider.addHistoryItem(newHistoryItem);
                          Navigator.of(context).pop();
                        },
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
