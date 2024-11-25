import 'package:untitled/core/enum_condition.dart';

class WeatherForecast{
  final String date;
  final double temperature;
  final WeatherCondition condition;
  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.condition
  });
}