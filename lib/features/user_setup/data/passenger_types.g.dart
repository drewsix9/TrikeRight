// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassengerTypeAdapter extends TypeAdapter<PassengerType> {
  @override
  final int typeId = 6;

  @override
  PassengerType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return PassengerType.regular;
      case 2:
        return PassengerType.studentSeniorPWD;
      case 3:
        return PassengerType.belowFiveYearsOld;
      default:
        return PassengerType.regular;
    }
  }

  @override
  void write(BinaryWriter writer, PassengerType obj) {
    switch (obj) {
      case PassengerType.regular:
        writer.writeByte(1);
        break;
      case PassengerType.studentSeniorPWD:
        writer.writeByte(2);
        break;
      case PassengerType.belowFiveYearsOld:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassengerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
