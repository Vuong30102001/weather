import 'package:flutter/material.dart';
import 'package:untitled/features/search_weather/domain/entities/weather.dart';

class WeatherIcons{
  static IconData getIconForCondition(WeatherCondition condition){
      switch(condition){
        case WeatherCondition.clear:
          return Icons.wb_sunny;
        case WeatherCondition.cloudy:
          return Icons.cloud;
        case WeatherCondition.rainy:
          return Icons.umbrella;
        case WeatherCondition.snowy:
          return Icons.ac_unit;
        default:
          return Icons.help_outline;
      }
  }
}