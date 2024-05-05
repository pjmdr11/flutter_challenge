part of 'state_cubit.dart';

sealed class LocationState extends Equatable {
  final bool? isLoading;
  final List<LocationModel>? states;
  final AppException? error;
  const LocationState({this.isLoading = false, this.states, this.error});

  @override
  List<Object> get props => [
        states ?? [],
        isLoading ?? false,
      ];
}

final class StateInitial extends LocationState {}

final class StatesLoading extends LocationState {
  const StatesLoading() : super(isLoading: true);
}

final class StatesFetchSuccess extends LocationState {
  const StatesFetchSuccess(List<LocationModel> states) : super(states: states);
}

final class StatesFetchError extends LocationState {
  const StatesFetchError(AppException e) : super(error: e);
}
