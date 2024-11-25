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
    bool? isLoading,
    Location? location,
    String? errorMessage,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      location: location ?? this.location,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, location, errorMessage];
}