import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latlng;
import 'package:provider/provider.dart';
import 'package:trikeright/core/const/coordinates.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openrouteservice_api.dart';

class OpenStreetMapApiProvider extends ChangeNotifier {
  List<latlng.LatLng> _points = [];
  List<latlng.LatLng> get points => _points;
  set points(List<latlng.LatLng> value) {
    _points = value;
    notifyListeners();
  }

  List<Marker> _markers = [];
  List<Marker> get markers => _markers;
  set markers(List<Marker> value) {
    _markers = value;
    notifyListeners();
  }

  LatLngBounds? _bounds;
  LatLngBounds? get bounds => _bounds;
  set bounds(LatLngBounds? value) {
    _bounds = value;
    notifyListeners();
  }

  final MapController mapController = MapController();

  void resetOpenStreetMap() {
    _points = [];
    _markers = [];
    _bounds = null;
    resetCamera();
    notifyListeners();
  }

  Future<void> processFeatureCoordinates(BuildContext context) async {
    var featureProvider = context.read<FeatureProvider>();
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
    var routeResponseApiModelProvider = context.read<RouteResponseProvider>();
    try {
      var response = await http.get(OpenRouteServiceApi.getRouteUrl(
        sourceFeature.geometry!.coordinates!.join(','),
        destinationFeature.geometry!.coordinates!.join(','),
      ));
      if (response.statusCode == 200) {
        routeResponseApiModelProvider
            .updateRouteResponseApiModel(response.body);
        Log.i(routeResponseApiModelProvider.routeResponseApiModel.toString());
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
          padding: EdgeInsets.fromLTRB(50.w, 100.h, 50.w, 250.h)),
    );
  }

  void resetCamera() {
    mapController.move(tagbilaranLatLng, 14);
  }
}
