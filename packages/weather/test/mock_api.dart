import 'dart:async';
import 'dart:math';

// Class that generates mock weather data
class MockAPI {
  //MockAPI.fromDefault();

  // Method that generates mock weather data for a given city
  static Future<Map<String, dynamic>> getWeatherData(String city) async {
    // Create a random number generator
    final random = Random();

    // Generate random weather data
    final temperature = random.nextInt(40).toDouble(); // Temperature in degrees Celsius
    final maxTemperature = temperature + random.nextInt(5).toDouble(); // Maximum temperature for the day
    final minTemperature = temperature - random.nextInt(5).toDouble(); // Minimum temperature for the day
    final pressure = random.nextInt(500) + 900; // Atmospheric pressure in hPa
    final humidity = random.nextInt(101); // Humidity as a percentage
    final windSpeed = random.nextDouble() * 20; // Wind speed in meters per second
    final windDirection = random.nextInt(360); // Wind direction in degrees

    // Build mock weather data as a Map
    final mockData = {
      'name': city, // city name
      'sys': {'country': 'PH'}, // country code for Philippines
      'main': {
        'temp': temperature, // Current temperature
        'temp_max': maxTemperature, // Maximum temperature for the day
        'temp_min': minTemperature, // Minimum temperature for the day
        'pressure': pressure, // Atmospheric pressure
        'humidity': humidity, // Humidity
      },
      'weather': [
        {
          'description': _getRandomWeatherDescription(), // Random weather description
          'icon': '01d', // Hardcoded weather icon code
        },
      ],
      'coord': {
        'lon': random.nextDouble() * 360 - 180, // Longitude
        'lat': random.nextDouble() * 180 - 90, // Latitude
      },
      'wind': {'speed': windSpeed, 'deg': windDirection}, // Wind speed and direction
    };

    // Delay the response by 500 milliseconds to simulate network latency
    return Future.delayed(const Duration(milliseconds: 500), () => mockData);
  }

  // Method that returns a random weather description string
  static String _getRandomWeatherDescription() {
    final descriptions = [
      'Thunderstorm with light rain',
      'Light intensity drizzle',
      'Light rain',
      'Light snow',
      'Mist',
      'Smoke',
      'Haze',
      'Dust',
      'Fog',
      'Sand',
      'Volcanic ash',
      'Squalls',
      'Tornado',
      'Clear sky',
      'Few clouds',
    ];
    final random = Random();
    return descriptions[random.nextInt(descriptions.length)];
  }
}
