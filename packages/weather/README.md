# Weather Forecast
This Weather Forecast App is a simple mobile application made in Flutter and Dart programming language that allows users to check the current weather conditions of a particular location. Users can enter a city name to get weather details like temperature, description, weather icon, and additional weather information such as the maximum and minimum temperature, pressure, humidity, wind speed, and wind direction. The app uses the OpenWeather API to retrieve weather data.

## Features
* Check current weather conditions and display additional weather information of a specific city.
* Search for city by entering city name in the search bar.

## Installation
To use the Weather Forecast App, follow these steps:
* Clone the repository to your local machine.
* Open the project in your preferred IDE (Android Studio or Visual Studio Code).
* Run the command flutter pub get in the terminal to install dependencies.
* Create a free account on OpenWeather API and get your API key.
* In the packages/weather/lib/api.dart file, replace the value of apiKey with your API key.
  '''const String apiKey = 'your_api_key_here';'''
* Run the app using the flutter run command.

## Usage
1. Enter the city name in the search bar.
2. Press the "Search" button or press the "Enter" key on your keyboard to search for the city.
3. The app will display the current weather condition and additional weather information of the searched city.

## Technologies Used
* Flutter: A mobile app development platform developed by Google that allows developers to build high-performance, high-fidelity, apps for iOS and Android, using a single codebase.
* Dart: A client-optimized programming language developed by Google for building web, server, and mobile applications. It is the language used for developing Flutter apps.
* OpenWeather API: A free weather API that provides current weather data and weather forecasts for any location in the world.
