import 'package:flutter/material.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/search/data/suggestion_response_provider.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';

class StateProvider extends ChangeNotifier {
  void resetTrikeRightState(
    TextEditingControllerProvider textEditingControllerProvider,
    SuggestionsResponseProvider suggestionsResponseProvider,
  ) {
    Log.i('resetTrikeRightState is called');
    textEditingControllerProvider.clearControllers();
    suggestionsResponseProvider.resetSuggestionsResponse();
    notifyListeners();
  }

  void checkRoutingIfIsComplete(
      BuildContext context,
      TextEditingController sourceController,
      TextEditingController destinationController,
      SuggestionsResponseProvider suggestionsResponseProvider,
      OpenStreetMapApiProvider openStreetMapApiListenFalse,
      DragHandleProvider dragHandleProviderListenFalse) async {
    while (!isRoutingComplete(
        sourceController, destinationController, suggestionsResponseProvider)) {
      await Future.delayed(const Duration(seconds: 1));
      if (isRoutingComplete(sourceController, destinationController,
          suggestionsResponseProvider)) {
        if (context.mounted) {
          Log.i('Routing is in progress');
          startRouting(context, openStreetMapApiListenFalse,
              dragHandleProviderListenFalse);
        }
        break;
      }
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

  void startRouting(
      BuildContext context,
      OpenStreetMapApiProvider openStreetMapApiListenFalse,
      DragHandleProvider dragHandleProviderListenFalse) {
    openStreetMapApiListenFalse.processFeatureCoordinates(context);
    dragHandleProviderListenFalse.closePanel();
  }
}
