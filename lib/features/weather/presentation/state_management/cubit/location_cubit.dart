import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/weather/domain/entities/location.dart';
import 'package:untitled/features/weather/domain/use_case/get_location_use_case.dart';
import 'package:untitled/features/weather/presentation/state_management/state/location_state.dart';

class LocationCubit extends Cubit<LocationState>{
  final GetLocationUseCase getLocationUseCase;
  LocationCubit({required this.getLocationUseCase}) : super (const LocationState());

  Future<void> fetchLocation(String city) async {
    emit(state.copyWith(isLoading: true));
    try{
      final Location location = await getLocationUseCase.execute(city);
      emit(state.copyWith(
        isLoading: false,
        location: location,
        errorMessage: null,
      ));
    }
    catch (error){
      emit(state.copyWith(
        isLoading: false,
        location: null,
        errorMessage: error.toString(),
      ));
    }
  }
}