import 'package:hive_flutter/hive_flutter.dart';
import 'package:trikeright/features/user_setup/data/passenger_types.dart';

part 'history_item.g.dart';

@HiveType(typeId: 7)
class HistoryItem {
  @HiveField(0)
  final String destination;
  @HiveField(1)
  final String source;
  @HiveField(2)
  final String distance;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final double duration;
  @HiveField(5)
  PassengerType passengerType = PassengerType.regular;
  @HiveField(6)
  final double baseRate;
  @HiveField(7, defaultValue: 0.0)
  double luggageCost = 0.0;
  @HiveField(8)
  late double total;

  HistoryItem({
    required this.destination,
    required this.source,
    required this.distance,
    required this.price,
    required this.duration,
    required this.passengerType,
    required this.baseRate,
    required this.luggageCost,
  });
}
