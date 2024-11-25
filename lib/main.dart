import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/weather/data/data_source/open_meteo_api_client.dart';
import 'features/weather/data/repositories/location_repository_impl.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';
import 'features/weather/domain/use_case/get_location_use_case.dart';
import 'features/weather/domain/use_case/get_weather_use_case.dart';
import 'features/weather/presentation/pages/weather_page.dart';
import 'features/weather/presentation/state_management/bloc/location_bloc.dart';
import 'features/weather/presentation/state_management/bloc/weather_bloc.dart';


void main() {
  final apiClient = OpenMeteoApiClient(http.Client());
  final locationRepository = LocationRepositoryImpl(apiClient);
  final weatherRepository = WeatherRepositoryImpl(apiClient);

  runApp(MyApp(
    getLocationUseCase: GetLocationUseCase(locationRepository),
    getWeatherUseCase: GetWeatherUseCase(weatherRepository),
  ));
}

class MyApp extends StatelessWidget {
  final GetLocationUseCase getLocationUseCase;
  final GetWeatherUseCase getWeatherUseCase;

  const MyApp({
    Key? key,
    required this.getLocationUseCase,
    required this.getWeatherUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationBloc(getLocationUseCase)),
        BlocProvider(create: (_) => WeatherBloc(getWeatherUseCase)),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const WeatherPage(),
      ),
    );
  }
}
