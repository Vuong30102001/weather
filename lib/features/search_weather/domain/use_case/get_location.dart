import '../entities/location.dart';
import '../repositories/location_repository.dart';

class GetLocation {
  final LocationRepository repository;

  GetLocation(this.repository);

  Future<Location> execute(String city) async {
    return await repository.getLocation(city);
  }
}
