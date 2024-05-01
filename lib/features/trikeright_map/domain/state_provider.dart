import 'package:flutter/material.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/search/data/suggestion_response_provider.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';

class StateProvider extends ChangeNotifier {
  late BuildContext context;

  void resetTrikeRightMapState(
    TextEditingControllerProvider textEditingControllerProvider,
    SuggestionsResponseProvider suggestionsResponseProvider,
    OpenStreetMapApiProvider openStreetMapApiProvider,
  ) {
    Log.i('resetTrikeRightState is called');
    textEditingControllerProvider.clearControllers();
    suggestionsResponseProvider.resetSuggestionsResponse();
    openStreetMapApiProvider.resetOpenStreetMap();
    notifyListeners();
  }

  void checkRoutingIfIsComplete(
      TextEditingController sourceController,
      TextEditingController destinationController,
      SuggestionsResponseProvider suggestionsResponseProvider,
      OpenStreetMapApiProvider openStreetMapApiListenFalse,
      DragHandleProvider dragHandleProviderListenFalse) async {
    while (true) {
      if (isRoutingComplete(sourceController, destinationController,
          suggestionsResponseProvider)) {
        if (context.mounted) {
          Log.i('Passed context.mounted check');
          startRouting(
              openStreetMapApiListenFalse, dragHandleProviderListenFalse);
        } else {
          Log.i('context.mounted check failed');
        }
        break;
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  bool isRoutingComplete(
      TextEditingController sourceController,
      TextEditingController destinationController,
      SuggestionsResponseProvider suggestionsResponseProvider) {
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

  void startRouting(OpenStreetMapApiProvider openStreetMapApiListenFalse,
      DragHandleProvider dragHandleProviderListenFalse) {
    Log.i('startRouting is called');
    openStreetMapApiListenFalse.processFeatureCoordinates(context);
    dragHandleProviderListenFalse.closePanel();
  }
}
