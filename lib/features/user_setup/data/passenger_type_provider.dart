import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PassengerType {
  student,
  seniorPWD,
  regular,
}

class PassengerTypeProvider extends ChangeNotifier {
  PassengerType? passengerType;

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
    savePassengerTypeSharedPref(); // save to shared pref
    notifyListeners();
  }

  // call before setPassengerType
  void initPassengerTypeSharedPref() {
    SharedPreferences.getInstance().then((prefs) {
      int indexFromSharedPref = prefs.getInt('passengerTypeIndex') ?? 2;
      setPassengerType(indexFromSharedPref);
    });
    notifyListeners();
  }

  // call in setPassengerType
  void savePassengerTypeSharedPref() {
    SharedPreferences.getInstance().then((prefs) {
      switch (passengerType) {
        case PassengerType.student:
          prefs.setInt('passengerTypeIndex', 0);
          break;
        case PassengerType.seniorPWD:
          prefs.setInt('passengerTypeIndex', 1);
          break;
        case PassengerType.regular:
          prefs.setInt('passengerTypeIndex', 2);
          break;
        case null:
          prefs.setInt('passengerTypeIndex', 2);
          break;
      }
    });
  }
}
