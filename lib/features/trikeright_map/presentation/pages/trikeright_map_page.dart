import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_build_map.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_sliding_up_panel.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';

class TrikeRightMapPage extends StatefulWidget {
  const TrikeRightMapPage({super.key});

  @override
  State<TrikeRightMapPage> createState() => _TrikeRightMapPageState();
}

class _TrikeRightMapPageState extends State<TrikeRightMapPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PassengerTypeProvider>(context, listen: false)
        .initPassengerTypeSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        // AppBar - Trike Right
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18.r),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'TrikeRight',
            textAlign: TextAlign.center,
            style: AppTextLightTheme.trikeRightAppBarTitle,
          ),
        ),
        // Stack containing _fAB and SlidingUpPanel
        body: Stack(
          children: [
            // Map and SlidingUpPanel
            Column(
              children: [
                const Expanded(
                  child: MyBuildMap(),
                ),
                // Sliding Up Panel
                Consumer<DragHandleProvider>(
                    builder: (context, value, child) => SlidingUpPanel(
                          defaultPanelState: PanelState.OPEN,
                          controller: value.panelController,
                          minHeight: 175.h,
                          maxHeight: ScreenUtil().screenHeight * 0.45,
                          color: const Color(0xFFF7FAFC),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(18.r),
                          ),
                          parallaxEnabled: true,
                          parallaxOffset: 0.5,
                          panelBuilder: (controller) => MySlidingUpPanel(
                            controller: controller,
                          ),
                        )),
              ],
            ),
            Positioned(
              top: 64.h,
              right: 16.w,
              child: _fAB(),
            ),
            Positioned(
              top: 200.h,
              right: 16.w,
              child: _fAB2(),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _fAB() {
    return FloatingActionButton(
      heroTag: 'fab',
      onPressed: () async {
        _onPressFAB(context);
      },
      child: const Icon(
        Icons.directions,
        color: Color(0xFF1C91F2),
      ),
    );
  }

  FloatingActionButton _fAB2() {
    return FloatingActionButton(
      heroTag: 'fab2',
      onPressed: () async {
        var textProvider =
            Provider.of<TextEditingControllerProvider>(context, listen: false);
        textProvider.sourceController.text = 'Bohol Wisdom School';
        textProvider.destinationController.text =
            'Bohol Island State University';
        Provider.of<OpenStreetMapApi>(context, listen: false)
            .testProcessFeatureCoordinatesHardcoded(context);
        Provider.of<DragHandleProvider>(context, listen: false).closePanel();
      },
      child: const Icon(
        Icons.directions,
        color: Color(0xFF1C91F2),
      ),
    );
  }

  void _onPressFAB(
    BuildContext context,
  ) {
    var sourceController =
        Provider.of<TextEditingControllerProvider>(context, listen: false)
            .sourceController;
    var destinationController =
        Provider.of<TextEditingControllerProvider>(context, listen: false)
            .destinationController;
    if (sourceController.text.isEmpty && destinationController.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text(
          'Please fill in the source and destination fields.',
        ),
      );
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      Provider.of<OpenStreetMapApi>(context, listen: false)
          .processFeatureCoordinates(context);
      Provider.of<DragHandleProvider>(context, listen: false).closePanel();
    }
  }
}
