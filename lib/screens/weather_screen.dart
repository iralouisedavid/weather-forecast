import 'package:flutter/material.dart';
import 'package:weather/location.dart';
import 'package:weather/weather.dart';

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
        width: MediaQuery.of(context).size.width, // Set the width to the screen width
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Weather(location: location),
            ),
          ],
        ),
      ),
    );
  }
}
