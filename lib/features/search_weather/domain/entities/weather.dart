enum WeatherCondition {
  clear,
  cloudy,
  rainy,
  snowy,
  unknown
}

class Weather {
  final WeatherCondition condition;
  final double temperature;

  Weather({
    required this.condition,
    required this.temperature,
  });
}
