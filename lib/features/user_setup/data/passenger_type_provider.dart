import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trikeright/features/user_setup/data/passenger_types.dart';

class PassengerTypeProvider extends ChangeNotifier {
  PassengerType? passengerType;

  void setPassengerType(int index) {
    switch (index) {
      case 0:
        passengerType = PassengerType.regular;
        break;
      case 1:
        passengerType = PassengerType.studentSeniorPWD;
        break;
      case 2:
        passengerType = PassengerType.belowFiveYearsOld;
        break;
    }
    savePassengerTypeSharedPref(); // save to shared pref
    notifyListeners();
  }

  // call before setPassengerType
  void initPassengerTypeSharedPref() {
    SharedPreferences.getInstance().then((prefs) {
      int indexFromSharedPref = prefs.getInt('passengerTypeIndex') ?? 0;
      setPassengerType(indexFromSharedPref);
      notifyListeners();
    });
  }

  // call in setPassengerType
  void savePassengerTypeSharedPref() {
    SharedPreferences.getInstance().then((prefs) {
      switch (passengerType) {
        case PassengerType.regular:
          prefs.setInt('passengerTypeIndex', 0);
          break;
        case PassengerType.studentSeniorPWD:
          prefs.setInt('passengerTypeIndex', 1);
          break;
        case PassengerType.belowFiveYearsOld:
          prefs.setInt('passengerTypeIndex', 2);
          break;
        case null:
          prefs.setInt('passengerTypeIndex', 0);
          break;
      }
    });
  }
}
