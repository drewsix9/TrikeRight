import 'package:trikeright/features/user_setup/data/passenger_types.dart';

class CalculateFareModel {
  final String source;
  final String destination;
  final String baseFare;
  final double totalDistance;
  final double totalDuration;
  final PassengerType passengerType;

  CalculateFareModel({
    required this.source,
    required this.destination,
    required this.baseFare,
    required this.totalDistance,
    required this.totalDuration,
    required this.passengerType,
  });

  @override
  String toString() {
    return 'CalculateFareModel(source: $source, destination: $destination, baseFare: $baseFare, totalDistance: $totalDistance, totalDuration: $totalDuration, passengerType: $passengerType)';
  }
}
