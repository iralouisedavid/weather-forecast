library weather;
import 'package:flutter/material.dart';
import 'package:weather/api.dart';
import 'package:weather/location.dart';

class Search {
  static Api _api = Api();

  // search for a list of locations matching the given query
  static Future<List<Location>> searchLocationList(String query, BuildContext context) async {
    try {
      List<Location> results = [];

      // Call 'fetchWeatherDataList' method of the Api class to get a list of weather data matching the query
      List<dynamic> data = await _api.fetchWeatherDataList(query, context);

      // Iterate through the weather data and create a Location object for each result
      for (var locationData in data) {
        results.add(Location.fromJson(locationData));
      }
      return results;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
