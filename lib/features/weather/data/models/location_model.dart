import '../../domain/entities/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final double latitude;
  final double longitude;
  final String name;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Location toEntity() {
    return Location(
      latitude: latitude,
      longitude: longitude,
      name: name,
    );
  }
}
