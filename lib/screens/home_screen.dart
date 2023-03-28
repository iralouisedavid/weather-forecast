import 'package:flutter/material.dart';
import 'package:weather/location.dart';
import 'package:weather/search.dart';
import 'weather_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController(); //search bar
  List<Location> _searchResults = []; //list to store search results
  //ValueNotifier<List<Location>> _searchResultsNotifier = ValueNotifier<List<Location>>([]);

  void _searchLocation(String query) async {
    List<Location> results = await Search.searchLocationList(query); // call searchLocationlist to get results
    setState(() {
      _searchResults = results;
    });
  }

  // void _searchLocation(String query) async {
  //   List<Location> results = await Search.searchLocationList(query); // Call the searchLocationList method to get a list of Location objects that match the search query
  //   _searchResultsNotifier.value = results; // Update the value of the _searchResultsNotifier with the new search results
  // }

  void _navigateToWeatherScreen(Location location) { //navgate to weather screen with the selected location
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(location: location),
      ),
    );
  }

  Widget _buildSearchResultsList() { //display search results in a listview
    return Expanded(
      child: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          Location location = _searchResults[index];
          return ListTile(
            title: Text(location.name),
            subtitle: Text('Latitude: ${location.latitude},  Longitude: ${location.longitude}'),
            onTap: () => _navigateToWeatherScreen(location),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Location',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onFieldSubmitted: (value) { // call _searchLocation function when form is submitted
                _searchLocation(value);
              },
            ),
            const SizedBox(height: 16.0),
            _searchResults.isEmpty ? const Expanded(
              child: Center(
                child: Text(
                  'Search Results',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            )
                : _buildSearchResultsList(),
            // _searchResultsNotifier.value.isEmpty
            //     ? const Expanded(
            //   child: Center(
            //     child: Text(
            //       'Search Results',
            //       style: TextStyle(fontSize: 16.0),
            //     ),
            //   ),
            // )
            //     : _buildSearchResultsList(),
          ],
        ),
      ),
    );
  }
}
