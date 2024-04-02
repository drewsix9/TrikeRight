import 'package:flutter/material.dart';

enum PassengerType {
  student,
  seniorPWD,
  regular,
}

class PassengerTypeProvider extends ChangeNotifier {
  PassengerType passengerType = PassengerType.regular;

  void setPassengerType(int index) {
    switch (index) {
      case 0:
        passengerType = PassengerType.student;
        break;
      case 1:
        passengerType = PassengerType.seniorPWD;
        break;
      case 2:
        passengerType = PassengerType.regular;
        break;
    }
    notifyListeners();
  }
}
