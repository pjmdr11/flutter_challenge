import 'dart:convert';

import 'package:flutter_challenge/src/domain/entities/location_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

List<LocationModel> locationModelListFromJson(json) =>
    List<LocationModel>.from((json).map((x) => LocationModel.fromJson(x)));

String countryModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class LocationModel extends Location with _$LocationModel {
  const factory LocationModel({
    required int? id,
    required String? value,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
