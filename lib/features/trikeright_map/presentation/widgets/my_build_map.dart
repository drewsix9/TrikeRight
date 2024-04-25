import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:provider/provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';

const latlng.LatLng tagbilaranLatLng =
    latlng.LatLng(9.64697490569609, 123.85528213870656);

class MyBuildMap extends StatefulWidget {
  const MyBuildMap({super.key});

  @override
  State<MyBuildMap> createState() => MyBuildMapState();
}

class MyBuildMapState extends State<MyBuildMap> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OpenStreetMapApi>(
      builder: (context, value, child) {
        return FlutterMap(
          mapController: value.mapController,
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
              markers: value.markers,
            ),
            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(
                  points: value.points,
                  strokeWidth: 5,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
