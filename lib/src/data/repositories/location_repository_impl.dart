import 'package:flutter_challenge/src/core/resources/data_state.dart';
import 'package:flutter_challenge/src/data/models/api_request_model.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:flutter_challenge/src/data/source/remote/api_service.dart';
import 'package:flutter_challenge/src/domain/repositories/location_repository.dart';
import 'package:injectable/injectable.dart';

import '../models//base_api_responsemodel.dart';

@Singleton(as: LocationRepository)
class LocationRepositoryImpl extends BaseApiResponseModel
    implements LocationRepository {
  final ApiService apiService;
  LocationRepositoryImpl({required this.apiService});

  @override
  Future<DataState<List<LocationModel>>> getCountries(ApiRequestModel model) {
    return getStateOf<List<LocationModel>>(
        request: () => apiService.request(model: model),
        jsonToModel: locationModelListFromJson);
  }

  @override
  Future<DataState<List<LocationModel>>> getStateFromCountry(
      ApiRequestModel requestModel) {
    return getStateOf<List<LocationModel>>(
        request: () => apiService.request(model: requestModel),
        jsonToModel: locationModelListFromJson);
  }
}
