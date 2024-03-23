import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/labled_textfield.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_text_field.dart';

class UserSetupPage extends StatefulWidget {
  const UserSetupPage({super.key});

  @override
  State<UserSetupPage> createState() => _UserSetupPageState();
}

class _UserSetupPageState extends State<UserSetupPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Image and text
          Stack(
            children: [
              Image.asset(
                  'lib/features/user_setup/presentation/utils/images/bicycle.png'),
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  'Let\'s get started with\nyour account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    height: 1.4.h,
                    letterSpacing: -0.70,
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
          // Full name
          SizedBox(height: 12.h),
          const LabelTextField(label: 'Full Name'),
          SizedBox(height: 8.h),
          // Textfield for full name
          MyTextField(
            hintText: '(eg. Juan Dela Cruz)',
            controller: fullNameController,
          ),
          SizedBox(height: 24.h),
          const LabelTextField(label: 'Mobile Number'),
          SizedBox(height: 8.h),
          // Textfield for Mobile Number
          MyTextField(
            hintText: '(eg. 091234567891)',
            controller: mobileNumberController,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
