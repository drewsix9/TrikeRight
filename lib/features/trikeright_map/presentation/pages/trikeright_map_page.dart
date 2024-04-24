import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_build_map.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_sliding_up_panel.dart';

class TrikeRightMapPage extends StatefulWidget {
  const TrikeRightMapPage({super.key});

  @override
  State<TrikeRightMapPage> createState() => _TrikeRightMapPageState();
}

class _TrikeRightMapPageState extends State<TrikeRightMapPage> {
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
                SlidingUpPanel(
                  defaultPanelState: PanelState.OPEN,
                  controller: panelController,
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
                    panelController: panelController,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 64.h,
              right: 16.w,
              child: _fAB(),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _fAB() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFFF7FAFC),
      onPressed: () {
        var provider = Provider.of<OpenStreetMapApi>(context, listen: false);
        provider.processFeatureCoordinates(context);
      },
      child: const Icon(
        Icons.directions,
        color: Color(0xFF1C91F2),
      ),
    );
  }
}
