import 'package:flutter/material.dart';

class TextEditingControllerProvider extends ChangeNotifier {
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  void clearControllers() {
    sourceController.clear();
    destinationController.clear();
    notifyListeners();
  }
}
