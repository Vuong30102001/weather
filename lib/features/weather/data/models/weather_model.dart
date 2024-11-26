import 'package:json_annotation/json_annotation.dart';
import '../../../../core/weather_condition.dart';
import '../../domain/entities/weather.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final double temperature;

  @JsonKey(fromJson: _mapStringToWeatherCondition)
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

  static WeatherCondition _mapStringToWeatherCondition(String condition) {
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
}
