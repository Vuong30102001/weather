import 'package:untitled/features/air_quality_caculation/domain/entities/air_quality.dart';

abstract class AirQualityRepository{
  Future<AirQuality> getAirQuality();
}