// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/src/core/resources/data_state.dart';
import 'package:flutter_challenge/src/data/models/app_exception_model.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:flutter_challenge/src/domain/usecases/location_detail_usecase.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

@lazySingleton
class StateCubit extends Cubit<LocationState> {
  final LocationDetailUseCase locationDetailUseCase;
  StateCubit({required this.locationDetailUseCase}) : super(StateInitial());

  void fetchCountryStates(int id) async {
    emit(const StatesLoading());
    DataState<List<LocationModel>> state =
        await locationDetailUseCase.getStateLists(id);
    if (state is ResultSuccess) {
      List<LocationModel> states = state.data ?? [];
      emit(StatesFetchSuccess(states));
    } else if (state is ResultFailure) {
      emit(StatesFetchError(state.appException!));
    }
  }

  LocationModel? getStateById(int id) {
    return state.states
        ?.where((element) => (element.id ?? -1) == id)
        .toList()
        .first;
  }
}
