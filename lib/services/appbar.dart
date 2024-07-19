import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.kWidth,
    required this.cityName,
    required this.temperature,
    required this.tempHeight,
    required this.condition,
  });

  final double kWidth;
  final String cityName;
  final double temperature;
  final double tempHeight;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
