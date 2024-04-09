// To parse this JSON data, do
//
//     final autoCompleteResponseApiModel = autoCompleteResponseApiModelFromJson(jsonString);

import 'dart:convert';

AutoCompleteResponseApiModel autoCompleteResponseApiModelFromJson(String str) =>
    AutoCompleteResponseApiModel.fromJson(json.decode(str));

String autoCompleteResponseApiModelToJson(AutoCompleteResponseApiModel data) =>
    json.encode(data.toJson());

class AutoCompleteResponseApiModel {
  List<Feature>? features;
  List<double>? bbox;

  AutoCompleteResponseApiModel({
    this.features,
    this.bbox,
  });

  AutoCompleteResponseApiModel copyWith({
    List<Feature>? features,
    List<double>? bbox,
  }) =>
      AutoCompleteResponseApiModel(
        features: features ?? this.features,
        bbox: bbox ?? this.bbox,
      );

  factory AutoCompleteResponseApiModel.fromJson(Map<String, dynamic> json) =>
      AutoCompleteResponseApiModel(
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => Feature.fromJson(x))),
        bbox: json["bbox"] == null
            ? []
            : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
      };
}

class Feature {
  Geometry? geometry;
  Properties? properties;
  List<double>? bbox;

  Feature({
    this.geometry,
    this.properties,
    this.bbox,
  });

  Feature copyWith({
    Geometry? geometry,
    Properties? properties,
    List<double>? bbox,
  }) =>
      Feature(
        geometry: geometry ?? this.geometry,
        properties: properties ?? this.properties,
        bbox: bbox ?? this.bbox,
      );

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
        bbox: json["bbox"] == null
            ? []
            : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry?.toJson(),
        "properties": properties?.toJson(),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
      };
}

class Geometry {
  List<double>? coordinates;

  Geometry({
    this.coordinates,
  });

  Geometry copyWith({
    List<double>? coordinates,
  }) =>
      Geometry(
        coordinates: coordinates ?? this.coordinates,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

class Properties {
  String? id;
  String? gid;
  String? layer;
  String? source;
  String? sourceId;
  String? name;
  String? street;
  double? distance;
  String? accuracy;
  String? country;
  String? countryGid;
  String? countryA;
  String? region;
  String? regionGid;
  String? regionA;
  String? county;
  String? countyGid;
  String? continent;
  String? continentGid;
  String? label;
  String? locality;
  String? localityGid;

  Properties({
    this.id,
    this.gid,
    this.layer,
    this.source,
    this.sourceId,
    this.name,
    this.street,
    this.distance,
    this.accuracy,
    this.country,
    this.countryGid,
    this.countryA,
    this.region,
    this.regionGid,
    this.regionA,
    this.county,
    this.countyGid,
    this.continent,
    this.continentGid,
    this.label,
    this.locality,
    this.localityGid,
  });

  Properties copyWith({
    String? id,
    String? gid,
    String? layer,
    String? source,
    String? sourceId,
    String? name,
    String? street,
    double? distance,
    String? accuracy,
    String? country,
    String? countryGid,
    String? countryA,
    String? region,
    String? regionGid,
    String? regionA,
    String? county,
    String? countyGid,
    String? continent,
    String? continentGid,
    String? label,
    String? locality,
    String? localityGid,
  }) =>
      Properties(
        id: id ?? this.id,
        gid: gid ?? this.gid,
        layer: layer ?? this.layer,
        source: source ?? this.source,
        sourceId: sourceId ?? this.sourceId,
        name: name ?? this.name,
        street: street ?? this.street,
        distance: distance ?? this.distance,
        accuracy: accuracy ?? this.accuracy,
        country: country ?? this.country,
        countryGid: countryGid ?? this.countryGid,
        countryA: countryA ?? this.countryA,
        region: region ?? this.region,
        regionGid: regionGid ?? this.regionGid,
        regionA: regionA ?? this.regionA,
        county: county ?? this.county,
        countyGid: countyGid ?? this.countyGid,
        continent: continent ?? this.continent,
        continentGid: continentGid ?? this.continentGid,
        label: label ?? this.label,
        locality: locality ?? this.locality,
        localityGid: localityGid ?? this.localityGid,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["id"],
        gid: json["gid"],
        layer: json["layer"],
        source: json["source"],
        sourceId: json["source_id"],
        name: json["name"],
        street: json["street"],
        distance: json["distance"]?.toDouble(),
        accuracy: json["accuracy"],
        country: json["country"],
        countryGid: json["country_gid"],
        countryA: json["country_a"],
        region: json["region"],
        regionGid: json["region_gid"],
        regionA: json["region_a"],
        county: json["county"],
        countyGid: json["county_gid"],
        continent: json["continent"],
        continentGid: json["continent_gid"],
        label: json["label"],
        locality: json["locality"],
        localityGid: json["locality_gid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gid": gid,
        "layer": layer,
        "source": source,
        "source_id": sourceId,
        "name": name,
        "street": street,
        "distance": distance,
        "accuracy": accuracy,
        "country": country,
        "country_gid": countryGid,
        "country_a": countryA,
        "region": region,
        "region_gid": regionGid,
        "region_a": regionA,
        "county": county,
        "county_gid": countyGid,
        "continent": continent,
        "continent_gid": continentGid,
        "label": label,
        "locality": locality,
        "locality_gid": localityGid,
      };
}
