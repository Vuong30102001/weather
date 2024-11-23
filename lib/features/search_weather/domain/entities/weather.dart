enum WeatherCondition{
  clear,
  cloudy,
  rain,
  snowy,
}

class Weather{
  final double temperature;
  final WeatherCondition weatherCondition;
  final double winSpeed;
  Weather({required this.temperature, required this.weatherCondition, required this.winSpeed});
}