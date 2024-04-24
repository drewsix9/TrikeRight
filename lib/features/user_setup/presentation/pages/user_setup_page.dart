import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trikeright/core/utils/validator.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_single_choice_chips.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_elevated_button.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_labled_textfield.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_text_field.dart';

final _formKey = GlobalKey<FormState>();

class UserSetupPage extends StatefulWidget {
  const UserSetupPage({super.key});

  @override
  State<UserSetupPage> createState() => _UserSetupPageState();
}

class _UserSetupPageState extends State<UserSetupPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  // FIXME: FocusNode not working
  final focusTextField = FocusNode();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Image and text
            Stack(
              children: [
                Image.asset(
                  'lib/features/user_setup/presentation/utils/images/bicycle.png',
                ),
                Positioned(
                  left: 16.w,
                  bottom: 16.h,
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
                ),
              ],
            ),
            // Full name
            SizedBox(height: 12.h),
            const MyLabelTextField(label: 'Full Name'),
            SizedBox(height: 8.h),
            // Textfield for full name
            MyTextFormField(
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  Validator.isName(value!) ? null : 'Please enter a valid name',
              hintText: '(eg. Juan Dela Cruz)',
              controller: fullNameController,
            ),
            SizedBox(height: 24.h),
            const MyLabelTextField(label: 'Mobile Number'),
            SizedBox(height: 8.h),
            // Textfield for Mobile Number
            MyTextFormField(
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // TODO: Add a validator for mobile number
              validator: (value) => Validator.isPhoneNumber(value!)
                  ? null
                  : 'Please enter a valid mobile number',
              keyboardType: TextInputType.phone,
              hintText: '(eg. 091234567891)',
              controller: mobileNumberController,
            ),
            SizedBox(height: 12.h),
            // Choice Chips
            SizedBox(
              width: 390.w,
              height: 56.h,
              child: const MySingleChoiceChips(),
            ),
            SizedBox(
              height: 12.h,
            ),
            Consumer<PassengerTypeProvider>(
              builder: (context, value, child) => MyElevatedButton(
                label: 'Next',
                onPressed: () {
                  // reference to the provider
                  if (_formKey.currentState!.validate() &&
                      (value.passengerType == PassengerType.regular ||
                          value.passengerType ==
                              PassengerType.studentSeniorPWD ||
                          value.passengerType ==
                              PassengerType.belowFiveYearsOld)) {
                    debugPrint(
                      'Name: ${fullNameController.text} \n Mobile Number: ${mobileNumberController.text}',
                    );
                    // Navigator.of(context)
                    //     .pushReplacementNamed('/persistent_nav_bar');
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.setBool('isFirstTime', false);
                      Navigator.of(context)
                          .pushReplacementNamed('/persistent_nav_bar');
                    });
                  } else {
                    debugPrint(
                      'Please fill all the fields and choose a choice',
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
