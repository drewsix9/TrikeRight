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
  final double distance;
  @HiveField(3)
  final double duration;
  @HiveField(4)
  final PassengerType passengerType;
  @HiveField(5)
  final double baseRate;
  @HiveField(6, defaultValue: 0.0)
  late double luggageCost = 0.0;
  @HiveField(7)
  late double totalFare;
  @HiveField(8)
  final String dateAndTime;

  HistoryItem({
    required this.destination,
    required this.source,
    required this.distance,
    required this.duration,
    required this.passengerType,
    required this.baseRate,
    required this.luggageCost,
    this.totalFare = 0.0,
    required this.dateAndTime,
  });

  HistoryItem copyWith({
    String? destination,
    String? source,
    double? distance,
    double? duration,
    PassengerType? passengerType,
    double? baseRate,
    double? luggageCost,
    double? totalFare,
  }) {
    return HistoryItem(
      destination: destination ?? this.destination,
      source: source ?? this.source,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      passengerType: passengerType ?? this.passengerType,
      baseRate: baseRate ?? this.baseRate,
      luggageCost: luggageCost ?? this.luggageCost,
      totalFare: totalFare ?? this.totalFare,
      dateAndTime: dateAndTime,
    );
  }

  @override
  String toString() {
    return '''
      HistoryItem(
      destination: $destination,
      source: $source,
      distance: $distance,
      duration: $duration,
      passengerType: $passengerType,
      baseRate: $baseRate,
      luggageCost: $luggageCost,
      totalFare: $totalFare
      dateAndTime: $dateAndTime
      )
    ''';
  }
}
