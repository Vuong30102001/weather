import 'package:untitled/features/search_weather/data/models/location_model.dart';

abstract class LocationRepository{
  Future<LocationModel> getLocation(String city);
}