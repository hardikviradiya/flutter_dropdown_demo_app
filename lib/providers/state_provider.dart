import 'package:flutter/foundation.dart';
import 'package:flutter_dropdown_demo_app/models/country.dart';

import '../models/state.dart';
import '../services/api_service.dart';

class StateProvider extends ChangeNotifier {
  List<State> _states = [];
  bool _loading = false;

  List<State> get states => _states;
  bool get loading => _loading;

  Future<void> fetchStates(Country country) async {
    _loading = true;
    notifyListeners();
    try {
      final statesData = await ApiService.fetchStates(country.id);
      _states = statesData.map((json) => State.fromJson(json)).toList();
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
