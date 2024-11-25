import '../entities/location.dart';

abstract class LocationRepository {
  Future<Location> getLocation(String city);
}
