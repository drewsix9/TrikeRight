import 'package:flutter/material.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';

class SuggestionsResponseProvider extends ChangeNotifier {
  bool isInitialized = false;
  List<ACFeature> _suggestionsReponse = [];

  List<ACFeature> get suggestionsReponse => _suggestionsReponse;

  set suggestionsReponse(List<ACFeature> value) {
    isInitialized = true;
    _suggestionsReponse = value;
    notifyListeners();
  }

  void clearSuggestionsReponse() {
    _suggestionsReponse.clear();
    isInitialized = false;
    notifyListeners();
  }
}
