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
    bool? isLoading,
    Weather? weather,
    String? errorMessage,
  }){
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, weather, errorMessage];
}