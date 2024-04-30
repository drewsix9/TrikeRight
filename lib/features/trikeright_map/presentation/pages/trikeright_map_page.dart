import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/search/data/suggestion_response_provider.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/trikeright_map/domain/state_provider.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_build_map.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_sliding_up_panel.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';

class TrikeRightMapPage extends StatefulWidget {
  const TrikeRightMapPage({super.key});

  @override
  State<TrikeRightMapPage> createState() => _TrikeRightMapPageState();
}

class _TrikeRightMapPageState extends State<TrikeRightMapPage> {
  late TextEditingController sourceController;
  late TextEditingController destinationController;
  late RouteResponseProvider routeResponseProvider;
  late SuggestionsResponseProvider suggestionsResponseProvider;
  late StateProvider stateProvider;
  late OpenStreetMapApiProvider openStreetMapApiProvider;
  late DragHandleProvider dragHandleProvider;

  @override
  void initState() {
    Log.i('TrikeRightMapPage initState is called');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sourceController =
          context.read<TextEditingControllerProvider>()
              .sourceController;
      destinationController =
          context.read<TextEditingControllerProvider>()
              .destinationController;
      routeResponseProvider =
          context.read<RouteResponseProvider>();
      suggestionsResponseProvider =
          context.read<SuggestionsResponseProvider>();
      stateProvider = context.read<StateProvider>();
      openStreetMapApiProvider =
          context.read<OpenStreetMapApiProvider>();
      dragHandleProvider =
          context.read<DragHandleProvider>();
      stateProvider.checkRoutingIfIsComplete(
          context,
          sourceController,
          destinationController,
          suggestionsResponseProvider,
          openStreetMapApiProvider,
          dragHandleProvider);
    });
    context.read<PassengerTypeProvider>()
        .initPassengerTypeSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      // AppBar - Trike Right
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12.r),
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
          const Positioned.fill(
            child: MyBuildMap(),
          ),
          // Sliding Up Panel
          Consumer<DragHandleProvider>(
            builder: (context, value, child) => SlidingUpPanel(
              margin: const EdgeInsets.only(bottom: 48),
              defaultPanelState: PanelState.OPEN,
              controller: value.panelController,
              minHeight: 175.h,
              maxHeight: ScreenUtil().screenHeight * 0.45,
              color: const Color(0xFFF7FAFC),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12.r),
              ),
              parallaxEnabled: true,
              parallaxOffset: 0.5,
              panelBuilder: (controller) => MySlidingUpPanel(
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
