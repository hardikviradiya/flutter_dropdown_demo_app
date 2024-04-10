import 'package:flutter/material.dart';
import 'package:flutter_dropdown_demo_app/providers/country_provider.dart';
import 'package:flutter_dropdown_demo_app/providers/state_provider.dart';
import 'package:flutter_dropdown_demo_app/screens/dropdown_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('DropdownScreen Widget Tests', () {
    testWidgets('Country and State Dropdowns Render Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<CountryProvider>(
              create: (_) => CountryProvider(),
            ),
            ChangeNotifierProvider<StateProvider>(
              create: (_) => StateProvider(),
            ),
          ],
          child: MaterialApp(
            home: DropdownScreen(),
          ),
        ),
      );

      expect(find.byType(DropdownButtonFormField), findsNWidgets(2));
    });
  });
}