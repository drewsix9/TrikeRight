import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_drag_handle.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_single_choice_chips.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_elevated_button.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_text_field.dart';

class MySlidingUpPanel extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  bool isStudent = false;
  bool isSenior = false;
  bool isPWD = false;
  bool isRegular = false;

  void togglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }

  MySlidingUpPanel({
    super.key,
    required this.controller,
    required this.panelController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Drag handle
        GestureDetector(
          onTap: togglePanel,
          child: const MyDragHandle(),
        ),
        SizedBox(height: 12.h),
        MyTextField(
          hintText: 'From where?',
          controller: sourceController,
        ),
        SizedBox(height: 24.h),
        MyTextField(
          hintText: 'To where?',
          controller: destinationController,
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 46.5.h,
          width: 390.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: const Text(
              'Passenger type',
              style: TextStyle(
                color: Color(0xFF0F1416),
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                height: 0.07,
                letterSpacing: -0.27,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 390.w,
          height: 56.h,
          child: const MySingleChoiceChips(),
        ),
        MyElevatedButton(
          label: 'Calculate Fare',
          onPressed: () {},
        )
      ],
    );
  }
}
