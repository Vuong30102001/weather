import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/location.dart';
import '../../domain/repositories/location_repository.dart';
import '../models/location_model.dart';
import '../data_source/open_meteo_api_client.dart';

class LocationRepositoryImpl implements LocationRepository {
  final OpenMeteoApiClient apiClient;

  LocationRepositoryImpl(this.apiClient);

  @override
  Future<Location> getLocation(String city) async {
    final response = await apiClient.fetchLocation(city);

    final jsonResponse = jsonDecode(response) as Map<String, dynamic>;
    if ((jsonResponse['results'] as List).isEmpty) {
      throw Exception('City not found');
    }

    final locationModel = LocationModel.fromJson(jsonResponse['results'][0]);
    return locationModel.toEntity();
  }
}
