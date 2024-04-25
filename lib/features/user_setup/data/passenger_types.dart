import 'package:hive/hive.dart';

part 'passenger_types.g.dart';

@HiveType(typeId: 6)
enum PassengerType {
  @HiveField(1)
  regular,
  @HiveField(2)
  studentSeniorPWD,
  @HiveField(3)
  belowFiveYearsOld,
}
