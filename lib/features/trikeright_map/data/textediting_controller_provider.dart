import 'package:flutter/material.dart';

class TextEditingControllerProvider extends ChangeNotifier {
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  void updateControllers() {
    notifyListeners();
  }
}
