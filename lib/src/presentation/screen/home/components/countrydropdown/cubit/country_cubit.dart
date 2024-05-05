import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/src/core/resources/data_state.dart';
import 'package:flutter_challenge/src/data/models/app_exception_model.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:flutter_challenge/src/domain/usecases/location_detail_usecase.dart';
import 'package:injectable/injectable.dart';

part 'country_state.dart';

@lazySingleton
class CountryCubit extends Cubit<CountryState> {
  final LocationDetailUseCase useCase;

  CountryCubit({required this.useCase}) : super(CountryInitial());

  void fetchCountries() async {
    emit(const CountryLoading());
    DataState<List<LocationModel>> state = await useCase.getCountryLists();
    if (state is ResultSuccess) {
      List<LocationModel> countries = state.data ?? [];
      emit(CountryFetchSuccess(countries));
    } else {
      emit(CountryError(state.appException!));
    }
  }

  LocationModel? getCountryById(int id) {
    return state.countries
        ?.where((element) => (element.id ?? -1) == id)
        .toList()
        .first;
  }
}
