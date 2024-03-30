import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_nav_button.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_sliding_up_panel.dart';

class TrikeRightMapPage extends StatefulWidget {
  const TrikeRightMapPage({super.key});

  @override
  State<TrikeRightMapPage> createState() => _TrikeRightMapPageState();
}

class _TrikeRightMapPageState extends State<TrikeRightMapPage> {
  late double screenHeight;
  static const LatLng _pTagbilaran = LatLng(9.6477, 123.8557);
  final PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar - Trike Right
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'TrikeRight',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF0F1416),
            fontSize: 18,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.27,
          ),
        ),
        backgroundColor: const Color(0xFFF7FAFC),
      ),
      // Sliding Up Panel
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: ScreenUtil().screenHeight * 0.4367201426024955,
        color: const Color(0xFFF7FAFC),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
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
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 75.h,
        color: const Color(0xFFF7FAFC),
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.w, right: 8.w, bottom: 6.h, top: 4.h),
          child: Container(
            width: 358.w,
            height: 54.h,
            color: const Color(0xFFF7FAFC),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyNavButton(
                  icon: Icons.route,
                  label: 'Route',
                ),
                MyNavButton(
                  icon: Icons.history,
                  label: 'History',
                ),
                MyNavButton(
                  icon: Icons.settings,
                  label: 'Preferences',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
