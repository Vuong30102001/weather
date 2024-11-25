import 'package:flutter/material.dart';
import 'package:untitled/core/weather_icons.dart';

import '../../domain/entities/weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          WeatherIcons.getIconForCondition(weather.condition),
          size:100,
          color: Colors.blue,
        )
        ,
        Text(
          'Condition: ${weather.condition.name}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Temperature: ${weather.temperature.toStringAsFixed(1)}°C',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
