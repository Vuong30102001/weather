import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_location.dart';
import '../event/location_event.dart';
import '../state/location_state.dart';


class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocation getLocation;

  LocationBloc(this.getLocation) : super(LocationInitial()) {
    on<FetchLocationEvent>((event, emit) async {
      emit(LocationLoading());
      try {
        final location = await getLocation.execute(event.city);
        emit(LocationLoaded(location));
      } catch (e) {
        emit(LocationError('Failed to fetch location: ${e.toString()}'));
      }
    });
  }
}
