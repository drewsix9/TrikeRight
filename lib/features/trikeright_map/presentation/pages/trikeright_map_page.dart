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

  @override
  void initState() {
    Log.i('TrikeRightMapPage initState is called');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sourceController =
          Provider.of<TextEditingControllerProvider>(context, listen: false)
              .sourceController;
      destinationController =
          Provider.of<TextEditingControllerProvider>(context, listen: false)
              .destinationController;
      routeResponseProvider =
          Provider.of<RouteResponseProvider>(context, listen: false);
      suggestionsResponseProvider =
          Provider.of<SuggestionsResponseProvider>(context, listen: false);
      _checkRoutingIfIsComplete();
    });
    Provider.of<PassengerTypeProvider>(context, listen: false)
        .initPassengerTypeSharedPref();
  }

  bool _isRoutingComplete() {
    Log.i('''isRoutingComplete is called
          sourceController: ${sourceController.text.isNotEmpty.toString()}
          destinationController: ${destinationController.text.isNotEmpty.toString()}
          suggestionsResponseProvider.sourceHasSelected: ${suggestionsResponseProvider.sourceHasSelected.toString()}
          suggestionsResponseProvider.destinationHasSelected: ${suggestionsResponseProvider.destinationHasSelected.toString()}
        ''');
    return sourceController.text.isNotEmpty &&
        destinationController.text.isNotEmpty &&
        suggestionsResponseProvider.sourceHasSelected &&
        suggestionsResponseProvider.destinationHasSelected;
  }

  void _checkRoutingIfIsComplete() async {
    while (!_isRoutingComplete()) {
      await Future.delayed(
          const Duration(seconds: 1)); // delay to prevent CPU overload
      if (_isRoutingComplete()) {
        if (mounted) {
          Log.i('Routing is in progress');
          _startRouting();
        }
        break;
      }
    }
  }

  void _startRouting() {
    Provider.of<OpenStreetMapApi>(context, listen: false)
        .processFeatureCoordinates(context);
    Provider.of<DragHandleProvider>(context, listen: false).closePanel();
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
