abstract class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {
  final double latitude;
  final double longitude;

  FetchWeatherEvent(this.latitude, this.longitude);
}
