import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_weather.dart';
import '../event/weather_event.dart';
import '../state/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;

  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await getWeather.execute(event.latitude, event.longitude);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError('Failed to fetch weather: ${e.toString()}'));
      }
    });
  }
}
