import 'package:flutter/material.dart';

import '../models/country.dart';
import '../models/state.dart' as country_state;

class ShowSelectionScreen extends StatelessWidget {
  final Country selectedCountry;
  final country_state.State selectedState;

  ShowSelectionScreen(
      {required this.selectedCountry, required this.selectedState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Selected Country and State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: 'You have selected '),
                    TextSpan(
                        text: selectedCountry.value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade300)),
                    const TextSpan(text: ' and '),
                    TextSpan(
                        text: selectedState.value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade300)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
