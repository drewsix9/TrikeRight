import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_sliding_up_panel.dart';

class TrikeRightMapPage extends StatefulWidget {
  const TrikeRightMapPage({super.key});

  @override
  State<TrikeRightMapPage> createState() => _TrikeRightMapPageState();
}

class _TrikeRightMapPageState extends State<TrikeRightMapPage> {
  static const LatLng _pTagbilaran = LatLng(9.6477, 123.8557);
  final PanelController panelController = PanelController();

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
          body: SlidingUpPanel(
            controller: panelController,
            minHeight: ScreenUtil().screenHeight * 0.220,
            maxHeight: ScreenUtil().screenHeight * 0.45,
            color: const Color(0xFFF7FAFC),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(18.r),
            ),
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            // Google Map
            body: const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pTagbilaran,
                zoom: 15,
              ),
            ),
            // Sliding Up Panel Builder
            panelBuilder: (controller) => MySlidingUpPanel(
              controller: controller,
              panelController: panelController,
            ),
          )
          // Bottom Navigation Bar
          ),
    );
  }
}
