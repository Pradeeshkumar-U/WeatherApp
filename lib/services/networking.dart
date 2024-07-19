import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

Widget buildingScrollPanel(
    ScrollController controller,
    double tempMax,
    double tempMin,
    String sunrise,
    String sunset,
    int pressure,
    int humidity,
    int windDir,
    int windSpeed,
    String windAng,
    double width) {
  return Stack(
    children: [
      SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: WeatherModel(
                            width: width,
                            data: tempMax,
                            myImage: 'max.png',
                            data1: 'maximum',
                            data2: 'temperature')
                        .myContainer()),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: WeatherModel(
                            width: width,
                            data: tempMin,
                            myImage: 'min.png',
                            data1: 'minimum',
                            data2: 'temperature')
                        .myContainer()),
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: WeatherModel2(
                      width: width,
                      data: '05:58:29 am',
                      myImage: 'sunrise.png',
                      data1: 'sunrise time',
                    ).myContainer()),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: WeatherModel2(
                      width: width,
                      data: '06:36:54 pm',
                      myImage: 'sunset.png',
                      data1: 'sunset time',
                    ).myContainer()),
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: WeatherModel3(
                  width: width,
                  data: windAng,
                  myImage: 'compass.png',
                  data1: windDir,
                ).myContainer()),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: WeatherModel3(
                  width: width,
                  data: windSpeed.toString(),
                  myImage: 'windspeed.png',
                  data1: windDir,
                ).myContainer()),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: WeatherModel2(
                      width: width,
                      data: pressure.toString(),
                      myImage: 'pressure.png',
                      data1: 'pressure',
                    ).myContainer()),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: WeatherModel2(
                      width: width,
                      data: humidity.toString(),
                      myImage: 'humidity.png',
                      data1: 'humidity',
                    ).myContainer()),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: 24,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromARGB(255, 237, 197, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                color: Colors.white70,
              ),
              height: 6,
              width: 40,
            ),
          ),
        ),
      ),
    ],
  );
}
