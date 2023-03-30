import 'package:flutter_test/flutter_test.dart';
import 'mock_api.dart';

void main() {
  group('WeatherTest', () {

    test('should return weather data for a given city', () async {
      // Arrange
      const city = 'Manila';

      // Act
      final data = await MockAPI.getWeatherData(city);

      // Assert
      expect(data['name'], city);
      expect(data['sys']['country'], 'PH');
      expect(data['main']['temp'], greaterThanOrEqualTo(0));
      expect(data['weather'][0]['description'], isNotEmpty);
      expect(data['weather'][0]['icon'], isNotEmpty);
      expect(data['coord']['lat'], inInclusiveRange(-90, 90));
      expect(data['coord']['lon'], inInclusiveRange(-180, 180));
      expect(data['main']['temp_max'], greaterThanOrEqualTo(data['main']['temp']));
      expect(data['main']['temp_min'], lessThanOrEqualTo(data['main']['temp']));
      expect(data['main']['pressure'], greaterThanOrEqualTo(900));
      expect(data['main']['humidity'], inInclusiveRange(0, 100));
      expect(data['wind']['speed'], greaterThanOrEqualTo(0));
      expect(data['wind']['deg'], inInclusiveRange(0, 359));
    });
  });
}