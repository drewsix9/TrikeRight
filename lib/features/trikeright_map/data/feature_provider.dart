import 'package:flutter/material.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';

class FeatureProvider extends ChangeNotifier {
  Feature? _sourceFeature;
  Feature? _destinationFeature;

  get sourceFeature => _sourceFeature;
  get destinationFeature => _destinationFeature;

  void setSourceFeature(Feature sourceFeature) {
    _sourceFeature = sourceFeature;
    notifyListeners();
  }

  void setDestinationFeature(Feature destinationFeature) {
    _destinationFeature = destinationFeature;
    notifyListeners();
  }
}
