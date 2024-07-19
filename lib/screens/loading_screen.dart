import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/weather.dart';

const apiKey = '1b0a0647a5c4db9adab3c093d2c746c2';

// ignore: must_be_immutable
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  String cityName = '';
  double? latitude = 0;
  double? longitude = 0;
  String condition = '';
  double temperature = 0.0;
  int conditionID = 0;
  double tempMax = 0.0;
  double tempMin = 0.0;
  String sunrise = '';
  String sunset = '';
  int pressure = 0;
  int humidity = 0;
  int windDir = 0;
  double windSpeed = 0.0;
  String windAng = '';

  MyLocation location = MyLocation();

  @override
  void initState() {
    super.initState();

    location.checker();
    getLocation();
  }

  @override
  void dispose() {
    location.checker();
    super.dispose();
  }

  void getLocation() async {
    location.checker();
    Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      setState(() {
        String data = response.body;
        var decodedData = jsonDecode(data);
        temperature = decodedData['main']['temp'];
        condition = decodedData['weather'][0]['description'];
        cityName = decodedData['name'];
        tempMax = decodedData['main']['temp_max'];
        tempMin = decodedData['main']['temp_min'];
        tempMax -= 273.15;
        tempMin -= 273.15;
        temperature -= 273.15;
        pressure = decodedData['main']['pressure'];
        humidity = decodedData['main']['humidity'];
        conditionID = decodedData['weather'][0]['id'];
        sunrise = DateFormat('hh:mm:ss a')
            .format(DateTime(decodedData['sys']['sunrise']));

        sunset = DateFormat('hh:mm:ss a')
            .format(DateTime(decodedData['sys']['sunset']));
        windDir = decodedData['wind']['deg'];
        windSpeed = decodedData['wind']['speed'];
        if (windDir < 90 && windDir > 0) {
          windAng = 'Northeast';
        } else if (windDir < 180 && windDir > 90) {
          windAng = 'Southeast';
        } else if (windDir < 270 && windDir > 180) {
          windAng = 'Southwest';
        } else if (windDir < 360 && windDir > 270) {
          windAng = 'Northwest';
        } else if (windDir == 0 || windDir == 360) {
          windAng = 'North';
        } else if (windDir == 90) {
          windAng = 'East';
        } else if (windDir == 180) {
          windAng = 'South';
        } else if (windDir == 270) {
          windAng = 'West';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0),
    );
    double kWidth = MediaQuery.sizeOf(context).width;
    double kHeight = MediaQuery.sizeOf(context).height;
    double tempHeight = 70;

    return GetMaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          title: SizedBox(
            width: kWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  cityName,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        color: Colors.black54,
                        blurRadius: 30,
                      ),
                    ],
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 249, 233, 255),
                    fontSize: 37,
                  ),
                ),
                cityName.isEmpty
                    ? const CircularProgressIndicator()
                    : Text(
                        '${temperature.toStringAsFixed(2)} °C',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 249, 233, 255),
                          fontFamily: 'Barlow Condensed',
                          fontSize: tempHeight,
                          shadows: const [
                            Shadow(
                              offset: Offset(3, 3),
                              color: Colors.black54,
                              blurRadius: 30,
                            ),
                          ],
                        ),
                      ),
                Text(
                  condition,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        color: Color.fromARGB(57, 0, 0, 0),
                        blurRadius: 30,
                      ),
                    ],
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 249, 233, 255),
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SlidingUpPanel(
          backdropEnabled: true,
          color: const Color.fromARGB(255, 237, 197, 255),
          maxHeight: kHeight * 0.7,

          minHeight: kHeight * 0.28,
          borderRadius: radius,
          onPanelOpened: () => setState(() {
            tempHeight = 30;
          }),
          onPanelClosed: () => setState(() {
            tempHeight = 70;
          }),
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          panelBuilder: (ScrollController controller) => buildingScrollPanel(
              controller,
              tempMax,
              tempMin,
              sunrise,
              sunset,
              pressure,
              humidity,
              windDir,
              windSpeed,
              windAng,
              MediaQuery.sizeOf(context).width),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Color.fromARGB(255, 98, 0, 172),
                    Color.fromARGB(255, 128, 0, 226),
                    Color.fromARGB(255, 170, 74, 244),
                    Color.fromARGB(255, 207, 165, 239),
                    Color.fromARGB(255, 167, 162, 162)
                  ], radius: 1, focal: Alignment.topCenter),
                ),
                width: kWidth,
                height: kHeight * 0.8,
              ),
              Align(
                alignment: const Alignment(0.9, 0.35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Change location',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                fillColor:
                                    const Color.fromARGB(255, 86, 0, 156),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                onPressed: () {
                                  Get.to(const CityName());
                                },
                                child: const Icon(
                                  Icons.location_searching,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.04),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  height: kHeight * 0.23,
                  width: kWidth * 0.9,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 130.0, left: 20),
                      child: Text(
                        getMessage(temperature.toInt()),
                        style: const TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              color: Color.fromARGB(57, 0, 0, 0),
                              blurRadius: 30,
                            ),
                          ],
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 72, 72, 72),
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(1.5, -0.25),
                child: Image.asset(
                  getWeatherIcon(
                    conditionID,
                  ),
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
