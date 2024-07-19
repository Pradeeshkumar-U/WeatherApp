import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:weather_app/screens/location_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const LocationScreen(),
    );
  }
}
