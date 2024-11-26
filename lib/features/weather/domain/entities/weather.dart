import '../../../../core/weather_condition.dart';

class Weather {
  final WeatherCondition condition;
  final double temperature;

  Weather({
    required this.condition,
    required this.temperature,
  });
}
