import 'dart:async';

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
  String position = '';
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future getLocation() async {
    try {
      bool check;
      LocationPermission permission;
      check = await Geolocator.isLocationServiceEnabled();
      if (!check) {
        permission = await Geolocator.requestPermission();
        setState(() {
          position = ('ENABLE LOCATION SERVICES');
        });
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            position = ('PERMISSION DENIED');
          });
        }
      }
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          position = ('PERMISSION DENIED FOREVER');
        });
      }

      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      setState(() {
        position = 'lati:${location.latitude}\tlong:${location.longitude}';
      });
    } catch (e) {
      setState(() {
        position = 'Unable to get position ($e)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          position,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
