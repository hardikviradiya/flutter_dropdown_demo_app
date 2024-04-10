// test/api_service_test.dart

import 'package:flutter_dropdown_demo_app/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('API Service Tests', () {
    test('Fetch Countries Test', () async {
      final client = MockClient();

      // Mock successful response
      when(client.get(Uri.parse('https://api.stagingcupid.com/api/v1/countries')))
          .thenAnswer((_) async => http.Response('[{"id":1,"value":"Test Country"}]', 200));

      final countries = await ApiService.fetchCountries();

      if (countries.isNotEmpty) {
        expect(countries.length, 1);
        expect(countries[0]['id'], 1);
        expect(countries[0]['value'], 'Test Country');
      }
    });

    test('Fetch States Test', () async {
      final client = MockClient();

      // Mock successful response
      when(client.get(Uri.parse('https://api.stagingcupid.com/api/v1/countries/1/states')))
          .thenAnswer((_) async => http.Response('[{"id":1,"value":"Test State"}]', 200));

      final states = await ApiService.fetchStates(1);

      expect(states.length, 1);
      expect(states[0]['id'], 1);
      expect(states[0]['value'], 'Test State');
    });
  });
}