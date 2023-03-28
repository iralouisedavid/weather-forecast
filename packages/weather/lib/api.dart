library weather;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // Define the base URL for the API and the API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String _apiKey = '38ab42c1845e0754b01ddb06feecb846';

  // method to fetch a list of weather data for multiple cities
  Future<List<Map<String, dynamic>>> fetchWeatherDataList(
      String city) async {
    // Construct the URL for the API call
    final url = '$_baseUrl/find?q=$city&cnt=10&appid=$_apiKey';
    // Send the API request using the http package
    final response = await http.get(Uri.parse(url));
    print(response.body);
    // Check the response status code, extract the list of weather data, and return it or throw an exception
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> list = [];
      if (data.containsKey('list')) {
        list = List<Map<String, dynamic>>.from(data['list']);
      }
      print(data['list']);
      return list;
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
