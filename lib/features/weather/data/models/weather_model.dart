import '../../../../core/enum_condition.dart';
import '../../domain/entities/weather.dart';

class WeatherModel {
  final WeatherCondition condition;
  final double temperature;

  WeatherModel({
    required this.condition,
    required this.temperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final conditionCode = json['current_weather']['weathercode'] as int;
    final temperature = json['current_weather']['temperature'] as double;

    return WeatherModel(
      condition: _mapConditionCode(conditionCode),
      temperature: temperature,
    );
  }

  static WeatherCondition _mapConditionCode(int code) {
    switch (code) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
        return WeatherCondition.cloudy;
      case 61:
      case 63:
      case 65:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }

  Weather toEntity() {
    return Weather(
      condition: condition,
      temperature: temperature,
    );
  }
}
