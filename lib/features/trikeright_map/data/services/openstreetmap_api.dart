import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latlng;
import 'package:provider/provider.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_api_model.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openrouteservice_api.dart';

class OpenStreetMapApi extends ChangeNotifier {
  List<latlng.LatLng> _points = [];
  List<Marker> _markers = [];
  final MapController mapController = MapController();
  LatLngBounds? _bounds;

  List<latlng.LatLng> get points => _points;
  List<Marker> get markers => _markers;
  LatLngBounds? get bounds => _bounds;

  set points(List<latlng.LatLng> value) {
    _points = value;
    notifyListeners();
  }

  set markers(List<Marker> value) {
    _markers = value;
    notifyListeners();
  }

  set bounds(LatLngBounds? value) {
    _bounds = value;
    notifyListeners();
  }

  Future<void> testProcessFeatureCoordinatesHardcoded(
      BuildContext context) async {
    var startPoint = [
      [9.660999, 123.85619]
    ];
    var endPoint = [
      [9.64795, 123.855339]
    ];

    try {
      // Here, instead of calling getCoordinates function, we directly assign the coordinates to the points and bounds

      // Make the HTTP GET request to the OpenRouteService API
      var response = await http.get(OpenRouteServiceApi.getRouteUrl(
          [startPoint[0][1], startPoint[0][0]].toList().join(','),
          [endPoint[0][1], endPoint[0][0]].toList().join(',')));

      RouteResponseApiModel rRAM = routeResponseApiModelFromJson(response.body);

      if (context.mounted) {
        Provider.of<RouteResponseProvider>(context, listen: false)
            .routeResponseApiModel = rRAM;
      }

      Log.i(rRAM.toString());

      _points = rRAM.features![0].geometry!.coordinates!
          .map((e) => latlng.LatLng(e[1].toDouble(), e[0].toDouble()))
          .toList();
      _bounds = rRAM.toLatLngBounds();

      markers = [
        Marker(
          point: latlng.LatLng(startPoint[0][0], startPoint[0][1]),
          child: const Icon(
            Icons.location_on,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
        Marker(
          point: latlng.LatLng(endPoint[0][0], endPoint[0][1]),
          child: const Icon(
            Icons.location_on,
            color: Colors.redAccent,
            size: 30,
          ),
        )
      ];

      mapController.fitCamera(
        CameraFit.bounds(
            bounds: _bounds!,
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 50)),
      );
    } catch (e) {
      Log.e(e);
    }
    Fluttertoast.showToast(
      msg: 'Routing Successful!',
      backgroundColor: const Color(0xff4bb543),
    );
  }

  Future<void> processFeatureCoordinates(BuildContext context) async {
    var featureProvider = Provider.of<FeatureProvider>(context, listen: false);
    var sourceFeature = featureProvider.sourceFeature;
    var destinationFeature = featureProvider.destinationFeature;
    if (sourceFeature != null && destinationFeature != null) {
      try {
        await getCoordinates(context, sourceFeature, destinationFeature);
      } catch (e) {
        Log.e('Error getting coordinates: $e');
      }
    }
  }

  Future<void> getCoordinates(BuildContext context, ACFeature sourceFeature,
      ACFeature destinationFeature) async {
    var routeResponseApiModelProvider =
        Provider.of<RouteResponseProvider>(context, listen: false);
    try {
      var response = await http.get(OpenRouteServiceApi.getRouteUrl(
        sourceFeature.geometry!.coordinates!.join(','),
        destinationFeature.geometry!.coordinates!.join(','),
      ));
      if (response.statusCode == 200) {
        routeResponseApiModelProvider
            .updateRouteResponseApiModel(response.body);
        updatePointsAndBounds(routeResponseApiModelProvider);
        if (context.mounted) {
          updateMarkers(context, sourceFeature, destinationFeature);
        }
      } else {
        throw Exception('Failed to load coordinates: ${response.statusCode}');
      }
    } catch (e) {
      Log.e('Error getting coordinates: $e');
      rethrow;
    } finally {
      Fluttertoast.showToast(
        msg: 'Routing Successful!',
        backgroundColor: const Color(0xff4bb543),
      );
    }
  }

  void updatePointsAndBounds(
      RouteResponseProvider routeResponseApiModelProvider) {
    points = routeResponseApiModelProvider
        .routeResponseApiModel!.features![0].geometry!.coordinates!
        .map((e) => latlng.LatLng(e[1].toDouble(), e[0].toDouble()))
        .toList();
    bounds =
        routeResponseApiModelProvider.routeResponseApiModel!.toLatLngBounds();
    updateBounds();
  }

  void updateMarkers(BuildContext context, ACFeature sourceFeature,
      ACFeature destinationFeature) {
    markers = [
      createMarker(sourceFeature),
      createMarker(destinationFeature),
    ];
  }

  Marker createMarker(ACFeature feature) {
    return Marker(
      point: latlng.LatLng(
        feature.geometry!.coordinates![1],
        feature.geometry!.coordinates![0],
      ),
      child: const Icon(
        Icons.location_on,
        color: Colors.redAccent,
        size: 30,
      ),
    );
  }

  void updateBounds() {
    mapController.fitCamera(
      CameraFit.bounds(
          bounds: bounds!,
          padding: const EdgeInsets.fromLTRB(50, 150, 50, 200)),
    );
  }
}
