# weather_forecast

## Version 1.0.0 - 28 March 2023
- Initial release of the application.

## Version 1.1.0 - 30 March 2023
### Features:
- Added modularity to the weather.dart file by extracting the second container that contains weather info and placing it in a separate weather_info.dart file.
- Improved the code quality in api.dart by defining the URL components as separate variables.
- Implemented better error handling by adding a snackbar that displays the response body message and creating a separate file called api_message.dart for the message. This snackbar will appear in the home screen if there's an error.

### Bug Fixes:
- Fixed the "ID does not exist" error message by removing the unnecessary id variable/value in the location.dart model class.

### Testing:
- Created a mock_api.dart file that will act as a mock API for unit testing.
- Added unit tests to weather_test.dart file to test the mock API.


