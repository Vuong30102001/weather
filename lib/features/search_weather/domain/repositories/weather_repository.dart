import 'package:untitled/features/search_weather/data/models/weather_model.dart';

abstract class WeatherRepository{
  Future<WeatherModel> getWeather(double latitude, double longitude);
}