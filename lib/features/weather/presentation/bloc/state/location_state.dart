import 'package:untitled/features/weather/domain/entities/location.dart';
import 'package:equatable/equatable.dart';

class LocationState extends Equatable{
  final bool isLoading;
  final Location? location;
  final String? errorMessage;
  const LocationState({
    this.isLoading = false,
    this.location,
    this.errorMessage
  });

  LocationState copyWith({
    required bool isLoading,
    Location? location,
    required String errorMessage,
  }) {
    return LocationState(
      isLoading: isLoading,
      location: location ?? this.location,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, location, errorMessage];
}