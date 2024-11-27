import 'package:json_annotation/json_annotation.dart';
import '../../../../core/weather_condition.dart';
import '../../domain/entities/weather.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final double temperature;

  @JsonKey(name: 'weathercode', fromJson: _mapStringToWeatherCondition)
  final WeatherCondition condition;

  WeatherModel({
    required this.temperature,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  Weather toEntity() {
    return Weather(
      temperature: temperature,
      condition: condition,
    );
  }

  static WeatherCondition _mapStringToWeatherCondition(dynamic condition) {
    if (condition is int) {
      switch (condition) {
        case 0:
          return WeatherCondition.clear;
        case 1:
        case 2:
        case 3:
        case 45:
        case 48:
          return WeatherCondition.cloudy;
        case 51:
        case 53:
        case 55:
        case 56:
        case 57:
        case 61:
        case 63:
        case 65:
        case 66:
        case 67:
        case 80:
        case 81:
        case 82:
        case 95:
        case 96:
        case 99:
          return WeatherCondition.rainy;
        case 71:
        case 73:
        case 75:
        case 77:
        case 85:
        case 86:
          return WeatherCondition.snowy;
        default:
          return WeatherCondition.unknown;
      }
    } else if (condition is String) {
      switch (condition.toLowerCase()) {
        case 'clear':
          return WeatherCondition.clear;
        case 'rainy':
          return WeatherCondition.rainy;
        case 'cloudy':
          return WeatherCondition.cloudy;
        case 'snowy':
          return WeatherCondition.snowy;
        default:
          return WeatherCondition.unknown;
      }
    }
    return WeatherCondition.unknown;
  }
}
