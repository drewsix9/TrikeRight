import 'package:flutter/material.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_api_model.dart';

class RouteResponseProvider extends ChangeNotifier {
  bool isInitialized = false;
  RouteResponseApiModel? _routeResponseApiModel = RouteResponseApiModel();

  // TODO: Delete setter after testing
  RouteResponseApiModel? get routeResponseApiModel => _routeResponseApiModel;
  set routeResponseApiModel(RouteResponseApiModel? value) {
    isInitialized = true;
    _routeResponseApiModel = value;
    notifyListeners();
  }

  void updateRouteResponseApiModel(String body) {
    _routeResponseApiModel = routeResponseApiModelFromJson(body);
    isInitialized = true;
    notifyListeners();
  }
}
