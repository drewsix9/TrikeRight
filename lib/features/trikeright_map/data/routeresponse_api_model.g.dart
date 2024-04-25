// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routeresponse_api_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RouteResponseApiModelAdapter extends TypeAdapter<RouteResponseApiModel> {
  @override
  final int typeId = 1;

  @override
  RouteResponseApiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RouteResponseApiModel(
      bbox: (fields[0] as List?)?.cast<double>(),
      features: (fields[1] as List?)?.cast<Feature>(),
    );
  }

  @override
  void write(BinaryWriter writer, RouteResponseApiModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bbox)
      ..writeByte(1)
      ..write(obj.features);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteResponseApiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeatureAdapter extends TypeAdapter<Feature> {
  @override
  final int typeId = 2;

  @override
  Feature read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feature(
      properties: fields[0] as Properties?,
      geometry: fields[1] as Geometry?,
    );
  }

  @override
  void write(BinaryWriter writer, Feature obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.properties)
      ..writeByte(1)
      ..write(obj.geometry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeometryAdapter extends TypeAdapter<Geometry> {
  @override
  final int typeId = 3;

  @override
  Geometry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Geometry(
      coordinates: (fields[0] as List?)
          ?.map((dynamic e) => (e as List).cast<double>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, Geometry obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.coordinates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeometryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PropertiesAdapter extends TypeAdapter<Properties> {
  @override
  final int typeId = 4;

  @override
  Properties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Properties(
      summary: fields[0] as Summary?,
    );
  }

  @override
  void write(BinaryWriter writer, Properties obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SummaryAdapter extends TypeAdapter<Summary> {
  @override
  final int typeId = 5;

  @override
  Summary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Summary(
      distance: fields[0] as double?,
      duration: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Summary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.distance)
      ..writeByte(1)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
