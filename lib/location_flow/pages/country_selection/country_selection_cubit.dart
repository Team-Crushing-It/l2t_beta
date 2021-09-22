import 'package:bloc/bloc.dart';
import 'package:l2t_beta/location_flow/location_flow.dart';

class CountrySelectionCubit extends Cubit<LocationState> {
  CountrySelectionCubit(this._locationRepository)
      : super(const LocationState.initial());

  final LocationRepository _locationRepository;

  void countriesRequested() async {
    emit(const LocationState.loading());

    try {
      final countryList = await _locationRepository.getCountries();
      final countries = countryList.map((c) => c.name).toList();
      emit(LocationState.success(countries));
    } on Exception {
      emit(const LocationState.failure());
    }
  }

  void countrySelected(String? value) {
    if (state.status == LocationStatus.success) {
      emit(state.copyWith(selectedLocation: value));
    }
  }
}
