// To parse this JSON data, do
//
//     final responseApiModel = responseApiModelFromJson(jsonString);

import 'dart:convert';

ResponseApiModel responseApiModelFromJson(String str) =>
    ResponseApiModel.fromJson(json.decode(str));

String responseApiModelToJson(ResponseApiModel data) =>
    json.encode(data.toJson());

class ResponseApiModel {
  List<double>? bbox;
  List<Feature>? features;

  ResponseApiModel({
    this.bbox,
    this.features,
  });

  ResponseApiModel copyWith({
    List<double>? bbox,
    List<Feature>? features,
  }) =>
      ResponseApiModel(
        bbox: bbox ?? this.bbox,
        features: features ?? this.features,
      );

  factory ResponseApiModel.fromJson(Map<String, dynamic> json) =>
      ResponseApiModel(
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

class Feature {
  Properties? properties;
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

class Geometry {
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

class Properties {
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

class Summary {
  double? distance;
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
