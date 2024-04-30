import 'package:flutter/material.dart';
import 'package:trikeright/features/search/data/autocomplete_api_model.dart';

class SuggestionsResponseProvider extends ChangeNotifier {
  bool sourceHasSelected = false;
  bool destinationHasSelected = false;
  List<ACFeature> _suggestionsReponse = [];

  List<ACFeature> get suggestionsReponse => _suggestionsReponse;

  set suggestionsReponse(List<ACFeature> value) {
    _suggestionsReponse = value;
    notifyListeners();
  }

  void clearSuggestionsReponse() {
    _suggestionsReponse.clear();
    notifyListeners();
  }
}
