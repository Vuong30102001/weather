import 'package:untitled/features/air_quality_caculation/domain/entities/air_quality.dart';
import 'package:untitled/features/air_quality_caculation/domain/repositories/air_quality_repository.dart';

class GetAirQuality{
  final AirQualityRepository repository;
  GetAirQuality(this.repository);

  Future<AirQuality?> execute() async {
    try{
      final airQuality = await repository.getAirQuality();
      return airQuality;
    }
    catch (e){
      throw Exception(e.toString());
    }
  }
}