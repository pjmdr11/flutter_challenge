import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/src/presentation/screen/home/components/statedropdown/cubit/state_cubit.dart';
import 'package:injectable/injectable.dart';

part 'homepage_state.dart';

@singleton
class HomepageCubit extends Cubit<HomePageState> {
  StateCubit stateCubit;
  HomepageCubit({required this.stateCubit}) : super(const HomePageState());

  void setSelectedCountryId(int id) {
    if (id >= 0) {
      emit(state.copyWith(selectedCountryId: id, selectedStateId: -1));
      stateCubit.fetchCountryStates(id);
      validateForm();
    }
  }

  void setSelectedStateId(int id) {
    emit(state.copyWith(selectedStateId: id));
    validateForm();
  }

  void validateForm() {
    emit(state.copyWith(
        validated: (state.selectedCountryId ?? -1) >= 0 &&
            (state.selectedStateId ?? -1) >= 0));
  }
}
