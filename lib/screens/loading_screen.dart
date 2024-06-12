import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ignore: must_be_immutable
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  void geoLocator() async {
    Position positionOf = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(positionOf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            geoLocator();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
