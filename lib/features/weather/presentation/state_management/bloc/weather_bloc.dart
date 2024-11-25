import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_weather_use_case.dart';
import '../event/weather_event.dart';
import '../state/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await getWeatherUseCase.execute(event.latitude, event.longitude);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError('Failed to fetch weather: ${e.toString()}'));
      }
    });
  }
}
