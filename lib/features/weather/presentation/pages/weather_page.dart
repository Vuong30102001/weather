import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_management/bloc/location_bloc.dart';
import '../state_management/bloc/weather_bloc.dart';
import '../state_management/event/location_event.dart';
import '../state_management/event/weather_event.dart';
import '../state_management/state/location_state.dart';
import '../state_management/state/weather_state.dart';
import '../widget/weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    final weatherBloc = context.read<WeatherBloc>();

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
                locationBloc.add(FetchLocationEvent(city));
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is LocationLoading) {
                  return const CircularProgressIndicator();
                } else if (state is LocationLoaded) {
                  final location = state.location;
                  weatherBloc.add(FetchWeatherEvent(location.latitude, location.longitude));
                  return Text('Location: ${location.name}');
                } else if (state is LocationError) {
                  return Text(state.message);
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return WeatherWidget(weather: state.weather);
                } else if (state is WeatherError) {
                  return Text(state.message);
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
