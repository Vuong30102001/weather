import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Weather> execute(double latitude, double longitude) async {
    return await repository.getWeather(latitude, longitude);
  }
}
