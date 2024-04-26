import 'package:trikeright/core/const/fare_luggage_rates.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/user_setup/data/passenger_types.dart';

double passengerTypeToBaseRate(PassengerType passengerType) {
  return fareRates[passengerType.index];
}

double passengerTypeToPerSucceedingKm(PassengerType passengerType) {
  return perSucceedingKm[passengerType.index];
}

double calculateTotalFare(HistoryItem historyItem) {
  double distanceToBeCalculated = (historyItem.distance - 1000) / 1000;
  double perSucceedingKm =
      passengerTypeToPerSucceedingKm(historyItem.passengerType);

  double totalFare = historyItem.baseRate +
      historyItem.luggageCost +
      (distanceToBeCalculated * perSucceedingKm);

  return double.parse((totalFare).toStringAsFixed(2));
}
