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
            padding: const EdgeInsets.fromLTRB(130.0, 20.0, 130.0, 0.0),
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
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Weather Information',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.thermostat_outlined),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Max. Temp.:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${location.maxTemperature.toStringAsFixed(0)}°C',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.thermostat_outlined),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Min. Temp.:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${location.minTemperature.toStringAsFixed(0)}°C',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.arrow_circle_down_outlined),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Pressure:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${location.pressure} hPa',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.opacity_outlined),
                            const SizedBox(height: 5.0),
                            const Text(
                              'Humidity:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${location.humidity}%',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.speed_outlined),
                            const SizedBox(height: 5.0),
                            const Text(
                              'Wind Speed:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${location.windSpeed} m/s',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.explore_outlined),
                            const SizedBox(height: 5.0),
                            const Text(
                              'Wind Direction:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${location.windDirection}°',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
