import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


import 'features/search_weather/data/data_source/open_meteo_api_client.dart';
import 'features/search_weather/data/repositories/location_repository_impl.dart';
import 'features/search_weather/data/repositories/weather_repository_impl.dart';
import 'features/search_weather/domain/use_case/get_location.dart';
import 'features/search_weather/domain/use_case/get_weather.dart';
import 'features/search_weather/presentation/State_Management/bloc/location_bloc.dart';
import 'features/search_weather/presentation/State_Management/bloc/weather_bloc.dart';
import 'features/search_weather/presentation/pages/weather_page.dart';


void main() {
  final apiClient = OpenMeteoApiClient(http.Client());
  final locationRepository = LocationRepositoryImpl(apiClient);
  final weatherRepository = WeatherRepositoryImpl(apiClient);

  runApp(MyApp(
    getLocation: GetLocation(locationRepository),
    getWeather: GetWeather(weatherRepository),
  ));
}

class MyApp extends StatelessWidget {
  final GetLocation getLocation;
  final GetWeather getWeather;

  const MyApp({
    Key? key,
    required this.getLocation,
    required this.getWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationBloc(getLocation)),
        BlocProvider(create: (_) => WeatherBloc(getWeather)),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const WeatherPage(),
      ),
    );
  }
}
