import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latlng;
import 'package:provider/provider.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openrouteservice_api.dart';

class OpenStreetMapApi extends ChangeNotifier {
  List<latlng.LatLng> _points = [];
  List<Marker> _markers = [];

  List<latlng.LatLng> get points => _points;
  List<Marker> get markers => _markers;

  set points(List<latlng.LatLng> value) {
    _points = value;
    notifyListeners();
  }

  set markers(List<Marker> value) {
    _markers.clear();
    _markers = value;
    notifyListeners();
  }

  void processFeatureCoordinates(
    BuildContext context,
  ) {
    debugPrint('Called processFeatureCoordinates');
    var featureProvider = Provider.of<FeatureProvider>(context, listen: false);
    var sourceFeature = featureProvider.sourceFeature;
    var destinationFeature = featureProvider.destinationFeature;
    if (sourceFeature != null && destinationFeature != null) {
      getCoordinates(
        context,
        sourceFeature.geometry!.coordinates!.join(','),
        destinationFeature.geometry!.coordinates!.join(','),
      );
    }
  }

  void getCoordinates(
    BuildContext context,
    String startPoint,
    String endPoint,
  ) async {
    var routeResponseApiModelProvider = Provider.of<RouteResponseProvider>(
      context,
      listen: false,
    );
    var response =
        await http.get(OpenRouteServiceApi.getRouteUrl(startPoint, endPoint));
// setStete(() {
    if (response.statusCode == 200) {
      routeResponseApiModelProvider.updateRouteResponseApiModel(response.body);
      debugPrint(
        routeResponseApiModelProvider.routeResponseApiModel.toString(),
      );
      points = routeResponseApiModelProvider
          .routeResponseApiModel.features![0].geometry!.coordinates!
          .map((e) => latlng.LatLng(e[1].toDouble(), e[0].toDouble()))
          .toList();
    }
    updateMarkers(context);
// setStete(() {

    final snackBar = SnackBar(
      content: Text(
        'Distance: ${routeResponseApiModelProvider.routeResponseApiModel.features![0].properties!.summary!.distance.toString()}',
      ),
    );
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void updateMarkers(BuildContext context) {
    var featureProvider = Provider.of<FeatureProvider>(context, listen: false);
    var sourceFeature = featureProvider.sourceFeature;
    var destinationFeature = featureProvider.destinationFeature;
    markers = [
      Marker(
        point: latlng.LatLng(
          sourceFeature.geometry!.coordinates![1],
          sourceFeature.geometry!.coordinates![0],
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.blueAccent,
          size: 30,
        ),
      ),
      Marker(
        point: latlng.LatLng(
          destinationFeature.geometry!.coordinates![1],
          destinationFeature.geometry!.coordinates![0],
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.blueAccent,
          size: 30,
        ),
      )
    ];
  }
}
