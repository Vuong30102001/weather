import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Condition: ${weather.condition}',
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
