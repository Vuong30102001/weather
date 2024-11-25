import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/weather/presentation/state_management/cubit/location_cubit.dart';
import 'package:untitled/features/weather/presentation/state_management/cubit/weather_cubit.dart';

import '../state_management/state/location_state.dart';
import '../state_management/state/weather_state.dart';
import '../widget/weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();
    final weatherCubit = context.read<WeatherCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter city name',
                hintText: 'Search',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onSubmitted: (city) {
                // locationBloc.add(FetchLocationEvent(city));
                locationCubit.fetchLocation(city);
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                } else if (state.location != null) {
                  final location = state.location!;
                  // weatherBloc.add(FetchWeatherEvent(location.latitude, location.longitude));
                  weatherCubit.fetchWeather(location.latitude, location.longitude);
                  return Text('Location: ${location.name}');
                } else if (state.errorMessage != null) {
                  return Text(state.errorMessage!);
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                } else if (state.weather != null) {
                  return WeatherWidget(weather: state.weather!);
                } else if (state.errorMessage != null) {
                  return Text(state.errorMessage!);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
