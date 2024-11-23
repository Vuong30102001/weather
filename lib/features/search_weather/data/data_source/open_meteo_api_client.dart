import 'package:http/http.dart' as http;

class OpenMeteoApiClient {
  final http.Client client;

  OpenMeteoApiClient(this.client);

  Future<String> fetchLocation(String city) async {
    final url = 'https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load location data');
    }
  }

  Future<String> fetchWeather(double latitude, double longitude) async {
    final url = 'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
