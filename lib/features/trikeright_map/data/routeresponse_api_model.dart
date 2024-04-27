import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart' as latlng;

part 'routeresponse_api_model.g.dart';

RouteResponseApiModel routeResponseApiModelFromJson(String str) =>
    RouteResponseApiModel.fromJson(json.decode(str));

String routeResponseApiModelToJson(RouteResponseApiModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 1)
class RouteResponseApiModel {
  @HiveField(0)
  List<double>? bbox;
  @HiveField(1)
  List<Feature>? features;

  RouteResponseApiModel({
    this.bbox,
    this.features,
  });

  @override
  String toString() {
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(toJson());
  }

  LatLngBounds toLatLngBounds() => LatLngBounds(
        latlng.LatLng(bbox![1], bbox![0]),
        latlng.LatLng(bbox![3], bbox![2]),
      );

  RouteResponseApiModel copyWith({
    List<double>? bbox,
    List<Feature>? features,
  }) =>
      RouteResponseApiModel(
        bbox: bbox ?? this.bbox,
        features: features ?? this.features,
      );

  factory RouteResponseApiModel.fromJson(Map<String, dynamic> json) =>
      RouteResponseApiModel(
        bbox: json["bbox"] == null
            ? []
            : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class Feature {
  @HiveField(0)
  Properties? properties;
  @HiveField(1)
  Geometry? geometry;

  Feature({
    this.properties,
    this.geometry,
  });

  Feature copyWith({
    Properties? properties,
    Geometry? geometry,
  }) =>
      Feature(
        properties: properties ?? this.properties,
        geometry: geometry ?? this.geometry,
      );

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "properties": properties?.toJson(),
        "geometry": geometry?.toJson(),
      };
}

@HiveType(typeId: 3)
class Geometry {
  @HiveField(0)
  List<List<double>>? coordinates;

  Geometry({
    this.coordinates,
  });

  Geometry copyWith({
    List<List<double>>? coordinates,
  }) =>
      Geometry(
        coordinates: coordinates ?? this.coordinates,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null
            ? []
            : List<List<double>>.from(json["coordinates"]!
                .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(
                coordinates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

@HiveType(typeId: 4)
class Properties {
  @HiveField(0)
  Summary? summary;

  Properties({
    this.summary,
  });

  Properties copyWith({
    Summary? summary,
  }) =>
      Properties(
        summary: summary ?? this.summary,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        summary:
            json["summary"] == null ? null : Summary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "summary": summary?.toJson(),
      };
}

@HiveType(typeId: 5)
class Summary {
  @HiveField(0)
  double? distance;
  @HiveField(1)
  double? duration;

  Summary({
    this.distance,
    this.duration,
  });

  Summary copyWith({
    double? distance,
    double? duration,
  }) =>
      Summary(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
      );

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
      };
}
