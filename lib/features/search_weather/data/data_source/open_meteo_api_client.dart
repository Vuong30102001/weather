import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenMeteoApiClient{
  final http.Client client;
  OpenMeteoApiClient(this.client);

  Future<Map<String, dynamic>> getLocation(String city) async {
    final response = await client.get(Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1'));

    if(response.statusCode != 200){
      throw Exception('Fail load data  location');
    }
    return json.decode(response.body);
  }
  
  Future<Map<String, dynamic>> getWeather(double latitude, double longitude) async {
    final response = await client.get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true'));
    if(response.statusCode != 200){
      throw Exception('Fail load data weather');
    }
    return json.decode(response.body);
  }
}