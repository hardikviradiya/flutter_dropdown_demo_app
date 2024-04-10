import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' hide find;

void main() {
  group('App Integration Tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Open Dropdown Screen', () async {
      await driver!.tap(find.text('Open Dropdown Screen'));

      // Expectation: Verify if the "Select a country:" text is displayed on the screen
      expect(await driver!.getText(find.text('Select a country:')), 'Select a country:');

      // Expectation: Verify if the "Select a state:" text is displayed on the screen
      expect(await driver!.getText(find.text('Select a state:')), 'Select a state:');

      // You can add more expectations for other elements on the screen
    });

    // Add more integration tests as needed
  });
}