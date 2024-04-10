import 'package:flutter/material.dart';
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
                : DropdownButtonFormField<Country>(
                    value: _selectedCountry,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        hintText: 'Select a country'),
                    onChanged: (Country? newValue) {
                      setState(() {
                        _selectedCountry = newValue!;
                        _selectedState = null;
                        stateProvider.fetchStates(newValue);
                      });
                    },
                    items: countryProvider.countries
                        .map<DropdownMenuItem<Country>>(
                          (Country country) => DropdownMenuItem<Country>(
                            value: country,
                            child: Text(country.value),
                          ),
                        )
                        .toList(),
                  ),
            const SizedBox(height: 20),
            _selectedCountry != null ? (countryProvider.loading || stateProvider.loading)
                ? const Center(child: CircularProgressIndicator())
                : DropdownButtonFormField<country_state.State>(
                    value: _selectedState,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        hintText: 'Select a state'),
                    onChanged: (country_state.State? newValue) {
                      setState(() {
                        _selectedState = newValue!;
                      });
                    },
                    items: stateProvider.states
                        .map<DropdownMenuItem<country_state.State>>(
                            (country_state.State state) =>
                                DropdownMenuItem<country_state.State>(
                                  value: state,
                                  child: Text(state.value),
                                ))
                        .toList(),
                  ) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
