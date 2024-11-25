import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_location_use_case.dart';
import '../event/location_event.dart';
import '../state/location_state.dart';


class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase getLocationUseCase;

  LocationBloc(this.getLocationUseCase) : super(LocationInitial()) {
    on<FetchLocationEvent>((event, emit) async {
      emit(LocationLoading());
      try {
        final location = await getLocationUseCase.execute(event.city);
        emit(LocationLoaded(location));
      } catch (e) {
        emit(LocationError('Failed to fetch location: ${e.toString()}'));
      }
    });
  }
}
