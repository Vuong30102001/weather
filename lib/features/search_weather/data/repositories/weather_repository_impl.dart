import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/weather_model.dart';
import '../data_source/open_meteo_api_client.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final OpenMeteoApiClient apiClient;

  WeatherRepositoryImpl(this.apiClient);

  @override
  Future<Weather> getWeather(double latitude, double longitude) async {
    final response = await apiClient.fetchWeather(latitude, longitude);

    final jsonResponse = jsonDecode(response) as Map<String, dynamic>;
    final weatherModel = WeatherModel.fromJson(jsonResponse);
    return weatherModel.toEntity();
  }
}
