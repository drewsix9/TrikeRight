// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryItemAdapter extends TypeAdapter<HistoryItem> {
  @override
  final int typeId = 7;

  @override
  HistoryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryItem(
      destination: fields[0] as String,
      source: fields[1] as String,
      distance: fields[2] as String,
      price: fields[3] as double,
      duration: fields[4] as double,
      passengerType: fields[5] as PassengerType,
      baseRate: fields[6] as double,
      luggageCost: fields[7] == null ? 0.0 : fields[7] as double,
    )..total = fields[8] as double;
  }

  @override
  void write(BinaryWriter writer, HistoryItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.destination)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.distance)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.passengerType)
      ..writeByte(6)
      ..write(obj.baseRate)
      ..writeByte(7)
      ..write(obj.luggageCost)
      ..writeByte(8)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
