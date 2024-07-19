import 'package:flutter/material.dart';

String getWeatherIcon(int condition) {
  if (condition == 0) {
    return 'assets/images/loading.png';
  } else if (condition < 300) {
    return 'assets/images/storm.png'; //🌩
  } else if (condition < 400) {
    return 'assets/images/light rain.png'; //🌧
  } else if (condition < 600) {
    return 'assets/images/heavy rain.png'; //☔️
  } else if (condition < 700) {
    return 'assets/images/snow.png'; //☃️
  } else if (condition < 800) {
    return 'assets/images/heavy wind.png'; //🌫
  } else if (condition == 800) {
    return 'assets/images/sun.png'; //☀️
  } else if (condition <= 804) {
    return 'assets/images/cloudy.png'; //☁️
  } else {
    return '‍assets/images/stars.png'; //🤷
  }
}

String getMessage(int temp) {
  if (temp == 0) {
    return 'Loading data...';
  } else if (temp > 25) {
    return 'It\'s 🍦 time and enjoy the day';
  } else if (temp > 20) {
    return 'Time for shorts and 👕 and Beach';
  } else if (temp < 10) {
    return 'You\'ll need 🧣 and 🧤 and enjoy the day';
  } else {
    return 'Not too cold or hot enjoy the day 🌞';
  }
}

class WeatherModel {
  double width;
  double data;
  String myImage;
  String data1;
  String data2;
  WeatherModel({
    required this.width,
    required this.data,
    required this.myImage,
    required this.data1,
    required this.data2,
  });

  Container myContainer() {
    return Container(
      width: width * 0.43,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 49, 19, 67),
          Color.fromARGB(255, 135, 0, 232),
          Color.fromARGB(255, 160, 77, 202),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$data1\n$data2',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 249, 233, 255),
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      offset: Offset(3, 3),
                      color: Colors.black54,
                      blurRadius: 30,
                    ),
                  ]),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 75,
                height: 100,
                child: Image.asset(
                  'assets/images/$myImage',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                '${data.toStringAsFixed(2)} °C',
                style: const TextStyle(
                    color: Color.fromARGB(255, 249, 233, 255),
                    fontFamily: 'Barlow condensed',
                    fontSize: 25,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        color: Colors.black54,
                        blurRadius: 20,
                      ),
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WeatherModel2 {
  double width;
  String data;
  String myImage;
  String data1;

  WeatherModel2({
    required this.width,
    required this.data,
    required this.myImage,
    required this.data1,
  });
  Container myContainer() {
    return Container(
      height: 200,
      width: width * 0.459,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 49, 19, 67),
          Color.fromARGB(255, 135, 0, 232),
          Color.fromARGB(255, 160, 77, 202),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              data1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 249, 233, 255),
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      offset: Offset(3, 3),
                      color: Colors.black54,
                      blurRadius: 30,
                    ),
                  ]),
            ),
          ),
          SizedBox(
            width: myImage == 'sunset.png' ? 74 : 75,
            height: myImage == 'sunset.png' ? 93 : 100,
            child: Image.asset(
              'assets/images/$myImage',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              whatText(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 249, 233, 255),
                  fontFamily: 'Barlow condensed',
                  fontSize: 25,
                  shadows: [
                    Shadow(
                      offset: Offset(3, 3),
                      color: Colors.black54,
                      blurRadius: 20,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  String whatText() {
    if (data1 == 'pressure') {
      return '$data hPa';
    } else if (data1 == 'humidity') {
      return '$data %';
    } else {
      return data;
    }
  }
}

class WeatherModel3 {
  double width;
  String data;
  String myImage;
  int data1;

  WeatherModel3({
    required this.width,
    required this.data,
    required this.myImage,
    required this.data1,
  });
  Container myContainer() {
    return Container(
      height: 189,
      width: width * 0.97,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 49, 19, 67),
          Color.fromARGB(255, 135, 0, 232),
          Color.fromARGB(255, 160, 77, 202),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myImage == 'compass.png'
                ? Image.asset('assets/images/$myImage')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'wind speed',
                        style: TextStyle(
                            color: Color.fromARGB(255, 249, 233, 255),
                            fontFamily: 'Quicksand',
                            fontSize: 28,
                            shadows: [
                              Shadow(
                                offset: Offset(3, 3),
                                color: Colors.black54,
                                blurRadius: 20,
                              ),
                            ]),
                      ),
                      Text(
                        '$data m/s',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 249, 233, 255),
                          fontFamily: 'Quicksand',
                          fontSize: 28,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              color: Colors.black54,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          myImage == 'compass.png'
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 249, 233, 255),
                          fontFamily: 'Quicksand',
                          fontSize: 28,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              color: Colors.black54,
                              blurRadius: 20,
                            ),
                          ]),
                    ),
                    Text(
                      '${data1.toString()} degree',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 249, 233, 255),
                          fontFamily: 'Quicksand',
                          fontSize: 25,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              color: Colors.black54,
                              blurRadius: 20,
                            ),
                          ]),
                    ),
                  ],
                )
              : SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/images/$myImage',
                  ),
                ),
        ],
      ),
    );
  }
}
