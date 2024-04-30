import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/trikeright_map/presentation/custom_route/hero_dialog_route.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_drag_handle.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_estimate_fare_dialog_box.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_single_choice_chips.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_text_field_to_search.dart';
import 'package:trikeright/features/user_setup/presentation/widgets/my_elevated_button.dart';

class MySlidingUpPanel extends StatelessWidget {
  final ScrollController controller;

  const MySlidingUpPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var textControllerProvider =
        Provider.of<TextEditingControllerProvider>(context);
    var textControllerProviderListenFalse =
        context.read<TextEditingControllerProvider>();
    var routeResponseProvider =
        context.read<RouteResponseProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Drag handle
        Consumer<DragHandleProvider>(
          builder: (context, value, child) => GestureDetector(
            onTap: () {
              value.togglePanel();
            },
            child: const MyDragHandle(),
          ),
        ),
        SizedBox(height: 12.h),
        MyTextFieldToSearch(
          controller: textControllerProvider.sourceController,
          hintText: 'From where?',
          onTap: () => _onTapTextField(
              context, textControllerProviderListenFalse.sourceController),
        ),
        SizedBox(height: 24.h),
        MyTextFieldToSearch(
          controller: textControllerProvider.destinationController,
          hintText: 'To where?',
          onTap: () => _onTapTextField(
              context, textControllerProviderListenFalse.destinationController),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 46.5.h,
          width: 390.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Text(
              'Passenger type',
              style: AppTextLightTheme.slidingUpPanelPassengerType,
            ),
          ),
        ),
        SizedBox(
          width: 390.w,
          height: 56.h,
          child: const MySingleChoiceChips(),
        ),
        MyElevatedButton(
          label: 'Estimate Fare',
          onPressed: () {
            _onPressEstimateFare(textControllerProviderListenFalse, context,
                routeResponseProvider);
          },
        ),
      ],
    );
  }

  void _onTapTextField(BuildContext context, TextEditingController controller) {
    Navigator.of(context).pushNamed(
      '/search_page',
      arguments: controller,
    );
  }

  void _onPressEstimateFare(
      TextEditingControllerProvider textControllerProviderListenFalse,
      BuildContext context,
      RouteResponseProvider routeResponseProvider) {
    var sourceController = textControllerProviderListenFalse.sourceController;
    var destinationController =
        textControllerProviderListenFalse.destinationController;
    if ((sourceController.text.isEmpty && destinationController.text.isEmpty) ||
        (routeResponseProvider.isInitialized == false)) {
      const snackBar = SnackBar(
        content: Text(
          'Please fill in the source and destination fields.',
        ),
      );
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      GlobalKey<State> loadingKey = GlobalKey<State>();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            key: loadingKey,
            child: const CircularProgressIndicator(),
          );
        },
      );

      // Simulate loading delay
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(loadingKey.currentContext!).pop();
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) {
              return const EstimateFareDialogBox();
            },
          ),
        );
      });
    }
  }
}
