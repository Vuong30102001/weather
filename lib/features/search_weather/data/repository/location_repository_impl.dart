import 'package:untitled/features/search_weather/data/data_source/open_meteo_api_client.dart';
import 'package:untitled/features/search_weather/data/models/location_model.dart';
import 'package:untitled/features/search_weather/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository{
  final OpenMeteoApiClient apiClient;
  LocationRepositoryImpl(this.apiClient);

  @override
  Future<LocationModel> getLocation(String city) async {
    final  locationData = await apiClient.getLocation(city);
    return LocationModel.fromJson(locationData);
  }
}