import 'package:flutter/material.dart';
import 'package:flutter_dropdown_demo_app/providers/country_provider.dart';
import 'package:flutter_dropdown_demo_app/providers/state_provider.dart';
import 'package:flutter_dropdown_demo_app/screens/dropdown_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountryProvider()),
          ChangeNotifierProvider(create: (_) => StateProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true,
          ),
          home: const DropdownScreen(),
        ));
  }
}
