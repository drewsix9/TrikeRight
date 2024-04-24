import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

const latlng.LatLng tagbilaranLatLng =
    latlng.LatLng(9.64697490569609, 123.85528213870656);
List<latlng.LatLng> points = [];
List<Marker> markers = [];

FlutterMap buildMap() {
  return FlutterMap(
    options: const MapOptions(
      interactionOptions: InteractionOptions(
        flags: InteractiveFlag.pinchZoom |
            InteractiveFlag.doubleTapZoom |
            InteractiveFlag.drag,
      ),
      initialCenter: tagbilaranLatLng,
      initialZoom: 15,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      ),
      MarkerLayer(
        markers: markers,
      ),
      PolylineLayer(
        polylineCulling: false,
        polylines: [
          Polyline(
            points: points,
            strokeWidth: 5,
            color: Colors.blue,
          ),
        ],
      ),
    ],
  );
}
