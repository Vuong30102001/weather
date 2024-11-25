import '../entities/location.dart';
import '../repositories/location_repository.dart';

class GetLocationUseCase {
  final LocationRepository repository;

  GetLocationUseCase(this.repository);

  Future<Location> execute(String city) async {
    return await repository.getLocation(city);
  }
}
