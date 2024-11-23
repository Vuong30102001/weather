import 'package:untitled/features/search_weather/data/data_source/open_meteo_api_client.dart';
import 'package:untitled/features/search_weather/data/models/weather_model.dart';
import 'package:untitled/features/search_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  final OpenMeteoApiClient apiClient;
  WeatherRepositoryImpl(this.apiClient);

  @override
  Future<WeatherModel> getWeather(double latitude, double longitude) async {
    final dataWeather = await apiClient.getWeather(latitude, longitude);
    return WeatherModel.fromJson(dataWeather);
  }
}