library weather;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'api_message.dart';

class Api {
  // Define the base URL for the API and the API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String _apiKey = '38ab42c1845e0754b01ddb06feecb8456';

  // method to fetch a list of weather data for multiple cities
  Future<List<Map<String, dynamic>>> fetchWeatherDataList(
      String city, BuildContext context) async {
    // Define the URL components as separate variables
    const String find = 'find';
    const String query = 'q';
    const String count = 'cnt';
    const String val = '10';
    const String id = 'appid';
    // Construct the URL for the API call
    final String url = '$_baseUrl/$find?$query=$city&$count=$val&$id=$_apiKey';
    // Send the API request using the http package
    final response = await http.get(Uri.parse(url));

    // Check the response status code, extract the list of weather data, and return it or throw an exception
    if (response.statusCode == 200) {
      debugPrint('Response status code: ${response.statusCode}');
      final data = json.decode(response.body);
      final list = List<Map<String, dynamic>>.from(data['list']);
      return list;
    } else {
      final data = json.decode(response.body);
      // use 'message' key as the error message. if none, set a general error message
      final message = data['message'] ?? 'Failed to fetch weather data';
      //snack bar to show error message body
      ApiMessage.showErrorSnackBar(context, message);
      throw Exception(message);
    }
  }
}
