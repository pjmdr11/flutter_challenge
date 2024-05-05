part of 'country_cubit.dart';

sealed class CountryState extends Equatable {
  final bool? isLoading;
  final List<LocationModel>? countries;
  final AppException? error;

  const CountryState({this.isLoading = false, this.countries, this.error});

  @override
  List<Object> get props => [isLoading ?? false, error!];
}

final class CountryInitial extends CountryState {}

final class CountryLoading extends CountryState {
  const CountryLoading() : super(isLoading: true);
}

final class CountryError extends CountryState {
  const CountryError(AppException e) : super(error: e, isLoading: false);
}

final class CountryFetchSuccess extends CountryState {
  const CountryFetchSuccess(List<LocationModel> lists)
      : super(countries: lists, isLoading: false);
}
