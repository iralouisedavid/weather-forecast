import 'package:flutter/material.dart';
import 'package:weather/location.dart';
import 'package:weather/weather.dart';
import 'package:weather/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  final Location location;

  WeatherScreen({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Weather(location: location),
              ),
            ),
            Expanded(
              flex: 2,
              child: WeatherInfo(location: location),
            ),
          ],
        ),
      ),
    );
  }
}
