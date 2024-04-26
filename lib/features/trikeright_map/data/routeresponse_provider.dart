import 'package:flutter/material.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_api_model.dart';

class RouteResponseProvider extends ChangeNotifier {
  bool isInitialized = false;
  RouteResponseApiModel? _routeResponseApiModel = RouteResponseApiModel();

  RouteResponseApiModel? get routeResponseApiModel => _routeResponseApiModel;

  void updateRouteResponseApiModel(String body) {
    _routeResponseApiModel = routeResponseApiModelFromJson(body);
    isInitialized = true;
    notifyListeners();
  }
}
