import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';

class MySingleChoiceChips extends StatefulWidget {
  const MySingleChoiceChips({super.key});

  @override
  State<MySingleChoiceChips> createState() => _MySingleChoiceChipsState();
}

class _MySingleChoiceChipsState extends State<MySingleChoiceChips> {
  List<String> choices = ['Student', 'Senior/PWD', 'Regular'];

  @override
  Widget build(BuildContext context) {
    return Consumer<PassengerTypeProvider>(
      builder: (context, value, child) => ChipsChoice.single(
        value: value.passengerType ?? 2,
        onChanged: (val) => value.setPassengerType(val as int),
        choiceItems: C2Choice.listFrom(
          source: choices,
          value: (i, v) => i,
          label: (i, v) => v,
        ),
        choiceStyle: C2ChipStyle.toned(
          height: 45.h,
          margin: EdgeInsets.only(left: 8.w),
          foregroundStyle: TextStyle(
            color: const Color(0xFF0F1416),
            fontSize: 14.sp,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w500,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        choiceCheckmark: true,
      ),
    );
  }
}
