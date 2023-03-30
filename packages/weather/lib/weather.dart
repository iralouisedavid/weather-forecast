library weather;
import 'package:flutter/material.dart';
import 'package:weather/location.dart';

class Weather extends StatelessWidget {
  final Location location;

  const Weather({required this.location});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(140.0, 20.0, 140.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  location.name,
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),
                Text(
                  '${location.temperature.toStringAsFixed(0)}°C',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 15.0),
                Text(
                  location.description,
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                Image.network(
                  'https://openweathermap.org/img/w/${location.icon}.png',
                  fit: BoxFit.fill,
                  height: 80.0,
                  width: 80.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
