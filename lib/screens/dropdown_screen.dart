import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_demo_app/screens/show_selection_screen.dart';
import 'package:provider/provider.dart';

import '../models/country.dart';
import '../models/state.dart' as country_state;
import '../providers/country_provider.dart';
import '../providers/state_provider.dart';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Country? _selectedCountry;
  country_state.State? _selectedState;

  @override
  void initState() {
    super.initState();
    Provider.of<CountryProvider>(context, listen: false).fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
    final stateProvider = Provider.of<StateProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 5,
        title: const Text('Country and State Dropdowns'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            countryProvider.loading
                ? const Center(child: CircularProgressIndicator())
                : CustomDropdown<Country>.search(
                    hintText: 'Select Country',
                    decoration: CustomDropdownDecoration(
                        closedFillColor: Colors.purple.shade50),
                    items: countryProvider.countries,
                    excludeSelected: false,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCountry = newValue;
                        _selectedState = null;
                        stateProvider.fetchStates(newValue);
                      });
                    }),
            const SizedBox(height: 20),
            _selectedCountry != null
                ? (countryProvider.loading || stateProvider.loading)
                    ? const Center(child: CircularProgressIndicator())
                    : CustomDropdown<country_state.State>.search(
                        hintText: 'Select State',
                        decoration: CustomDropdownDecoration(
                            closedFillColor: Colors.purple.shade50),
                        items: stateProvider.states,
                        excludeSelected: false,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedState = newValue;
                          });
                        })
                : const SizedBox.shrink(),
            const SizedBox(height: 100),
            Center(
                child: ElevatedButton(
              onPressed: () {
                if (_selectedCountry != null && _selectedState != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShowSelectionScreen(
                        selectedCountry: _selectedCountry!,
                        selectedState: _selectedState!,
                      ),
                    ),
                  );
                } else {
                  _showSnackBar('Please select both country and state.');
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade50,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
              child: const Text('Submit', style: TextStyle(fontSize: 17)),
            )),
          ],
        ),
      ),
    );
  }

  // Function to show Snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
