import 'package:equatable/equatable.dart';

import '../../../domain/entities/weather.dart';

class WeatherState extends Equatable{
  final bool isLoading;
  final Weather? weather;
  final String? errorMessage;
  const WeatherState({
    this.isLoading = false,
    this.weather,
    this.errorMessage
  });

  WeatherState copyWith({
    required bool isLoading,
    Weather? weather,
    required String errorMessage,
  }){
    return WeatherState(
      isLoading: isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, weather, errorMessage];
}