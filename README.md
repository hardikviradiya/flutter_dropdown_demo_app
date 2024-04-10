# Dropdown Screen App

This Flutter application demonstrates a simple screen with two dropdowns for selecting countries and states. The countries and states are fetched from an API and displayed in the dropdowns. The user can select a country, and the corresponding states for that country will be loaded in the second dropdown.

## Project Structure

The project follows a standard Flutter project structure with the following directories:

- **lib**: Contains the Dart source code for the application.
    - **models**: Contains model classes for representing countries and states.
    - **providers**: Contains provider classes for managing the state of countries and states.
    - **screens**: Contains the `DropdownScreen` widget responsible for rendering the UI.
    - **services**: Contains the `ApiService` class responsible for making API calls.
- **test**: Contains unit, widget, and integration tests for the application.

This is a single screen in Flutter that shows two Dropdowns.
- The first Dropdown loads a list of Countries.
- The second Dropdown loads a list of States.
- A user can select a Country, then a State.
- When a Country is selected, the list of States loads for that Country.
- The list of Countries and States is loaded from teh API.

# Clone the repository to your local machine:
https://github.com/hardikviradiya/flutter_dropdown_demo_app

# Run the following command to fetch the project dependencies:
flutter pub get

# Finally, run the project on a connected device or simulator:
flutter run

# To run unit tests, use the following command:
flutter test test/unit

# To run widget tests, use the following command:
flutter test test/widget

# To run integration tests, use the following command:
flutter test test/integration


# License
--
