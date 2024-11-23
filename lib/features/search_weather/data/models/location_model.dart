import '../../domain/entities/location.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  final String name;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      name: json['name'] as String,
    );
  }

  Location toEntity() {
    return Location(
      latitude: latitude,
      longitude: longitude,
      name: name,
    );
  }
}
