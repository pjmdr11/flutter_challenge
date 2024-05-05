part of 'homepage_cubit.dart';

class HomePageState extends Equatable {
  final int? selectedCountryId;
  final int? selectedStateId;
  final bool? formValidated;

  const HomePageState(
      {this.selectedCountryId, this.selectedStateId, this.formValidated});

  HomePageState copyWith(
          {int? selectedCountryId, int? selectedStateId, bool? validated}) =>
      HomePageState(
          selectedCountryId: selectedCountryId ?? this.selectedCountryId,
          selectedStateId: selectedStateId ?? this.selectedStateId,
          formValidated: validated ?? formValidated);

  factory HomePageState.fromJson(Map<String, dynamic> json) => HomePageState(
      selectedCountryId: json["selectedCountryId"],
      selectedStateId: json["selectedStateId"],
      formValidated: json["formValidated"]);

  Map<String, dynamic> toJson() => {
        "selectedCountryId": selectedCountryId,
        "selectedStateId": selectedStateId,
        "formValidated": formValidated
      };

  @override
  List<Object?> get props =>
      [selectedCountryId, selectedStateId, formValidated];
}
