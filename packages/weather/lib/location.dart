class Location {
  final String name;
  final String country;
  final double temperature;
  final String description;
  final String icon;
  final double latitude;
  final double longitude;
  final double maxTemperature;
  final double minTemperature;
  final double pressure;
  final int humidity;
  final double windSpeed;
  final int windDirection;

  Location({
    required this.name,
    required this.country,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.latitude,
    required this.longitude,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final coord = json['coord'];
    final wind = json['wind'];
    final temperature = main['temp'].toDouble() - 273.15; // Kelvin to Celcius
    final maxTemperature = main['temp_max'].toDouble() - 273.15; // Kelvin to Celcius
    final minTemperature = main['temp_min'].toDouble() - 273.15; // Kelvin to Celcius
    final pressure = main['pressure'].toDouble();
    final humidity = main['humidity'] as int;
    final windSpeed = wind['speed'].toDouble();
    final windDirection = wind['deg'] as int;

    return Location(
      name: json['name'],
      country: json['sys']['country'],
      temperature: temperature, // modified temperature value
      description: weather['description'],
      icon: weather['icon'],
      latitude: coord['lat'].toDouble(),
      longitude: coord['lon'].toDouble(),
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
      pressure: pressure,
      humidity: humidity,
      windSpeed: windSpeed,
      windDirection: windDirection,
    );
  }
}
