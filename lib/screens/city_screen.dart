import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/services/search.dart';

class CityName extends StatefulWidget {
  const CityName({super.key});

  @override
  State<CityName> createState() => _CityNameState();
}

List _cityName = [];

class _CityNameState extends State<CityName> {
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/city.list.json');
    final data = await json.decode(response);
    for (int i = 0; i <= 102908597; i++) {
      setState(() {
        _cityName += data[i]['name'];
      });
    }
  }

  @override
  void initState() {
    _CityNameState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_cityName);
    double kWidth = MediaQuery.sizeOf(context).width;
    double kHeight = MediaQuery.sizeOf(context).height;
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(colors: [
          Color.fromARGB(255, 98, 0, 172),
          Color.fromARGB(255, 128, 0, 226),
          Color.fromARGB(255, 170, 74, 244),
          Color.fromARGB(255, 207, 165, 239),
          Color.fromARGB(255, 167, 162, 162),
        ], radius: 1.8, focal: Alignment.bottomCenter),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50.0, horizontal: 8),
                child: GestureDetector(
                  onTap: () =>
                      showSearch(delegate: SearchBox(), context: context),
                  child: Container(
                    width: kWidth * 0.99,
                    height: kHeight * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromARGB(255, 137, 0, 192),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.white70,
                          size: 24,
                        ),
                        Text(
                          '  Add new location',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 24,
                              fontFamily: 'Quicksand'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
