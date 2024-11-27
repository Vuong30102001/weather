import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/weather/domain/use_case/get_weather_use_case.dart';
import 'package:untitled/features/weather/presentation/bloc/state/weather_state.dart';

import '../../../domain/entities/weather.dart';

class WeatherCubit extends Cubit<WeatherState>{
  final GetWeatherUseCase getWeatherUseCase;
  WeatherCubit({required this.getWeatherUseCase}) : super(const WeatherState());

  Future<void> fetchWeather(double latitude, double longitude) async {
    emit(state.copyWith(isLoading: true));
    try{
      final Weather weather = await getWeatherUseCase.execute(latitude, longitude);
      emit(state.copyWith(
        isLoading: false,
        weather: weather,
        errorMessage: null,
      ));
    }
    catch (error){
      emit(state.copyWith(
        isLoading: false,
        weather: null,
        errorMessage: error.toString(),
      ));
    }
  }
}