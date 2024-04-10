import 'package:flutter/foundation.dart';

import '../models/country.dart';
import '../services/api_service.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> _countries = [];
  bool _loading = false;

  List<Country> get countries => _countries;
  bool get loading => _loading;

  Future<void> fetchCountries() async {
    _loading = true;
    notifyListeners();
    try {
      final countriesData = await ApiService.fetchCountries();
      _countries = countriesData.map((json) => Country.fromJson(json)).toList();
      _loading = false;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _loading = false;
      notifyListeners();
    }
  }
}
