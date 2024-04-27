import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DragHandleProvider extends ChangeNotifier {
  final PanelController panelController = PanelController();

  void togglePanel() {
    if (panelController.isPanelClosed) {
      panelController.open();
    } else {
      panelController.close();
    }
    notifyListeners();
  }

  void closePanel() {
    panelController.close();
    notifyListeners();
  }
}
