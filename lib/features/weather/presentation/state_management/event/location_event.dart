abstract class LocationEvent {}

class FetchLocationEvent extends LocationEvent {
  final String city;

  FetchLocationEvent(this.city);
}
  