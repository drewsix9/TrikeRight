import 'package:flutter/material.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';

class FeatureProvider extends ChangeNotifier {
  ACFeature _sourceFeature = ACFeature();
  ACFeature _destinationFeature = ACFeature();

  get sourceFeature => _sourceFeature;
  get destinationFeature => _destinationFeature;

  void setSourceFeature(ACFeature sourceFeature) {
    _sourceFeature = sourceFeature;
    notifyListeners();
  }

  void setDestinationFeature(ACFeature destinationFeature) {
    _destinationFeature = destinationFeature;
    notifyListeners();
  }
}
