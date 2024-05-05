import 'package:flutter_challenge/src/core/resources/data_state.dart';
import 'package:flutter_challenge/src/data/models/api_request_model.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:injectable/injectable.dart';

abstract class LocationRepository {
  Future<DataState<List<LocationModel>>> getCountries(
      ApiRequestModel requestModel);

  Future<DataState<List<LocationModel>>> getStateFromCountry(
      ApiRequestModel requestModel);
}
