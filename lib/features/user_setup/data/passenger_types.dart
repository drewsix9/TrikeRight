import 'package:hive/hive.dart';

part 'passenger_types.g.dart';

@HiveType(typeId: 6)
enum PassengerType {
  @HiveField(0)
  regular,
  @HiveField(1)
  studentSeniorPWD,
  @HiveField(2)
  belowFiveYearsOld,
}
