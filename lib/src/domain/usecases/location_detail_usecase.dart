import 'package:flutter_challenge/src/core/constants/api_constants.dart';
import 'package:flutter_challenge/src/core/resources/data_state.dart';
import 'package:flutter_challenge/src/data/models/api_request_model.dart';
import 'package:flutter_challenge/src/data/models/location_model.dart';
import 'package:flutter_challenge/src/domain/repositories/location_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocationDetailUseCase {
  final LocationRepository locationRepository;

  LocationDetailUseCase({required this.locationRepository});

  Future<DataState<List<LocationModel>>> getCountryLists() async {
    return await locationRepository.getCountries(ApiRequestModel(
      url: countriesEndpoint,
    ));
  }

  Future<DataState<List<LocationModel>>> getStateLists(int countryId) async {
    final endPoint =
        statesEndpoint.replaceAll("{country_id}", countryId.toString());
    return await locationRepository
        .getStateFromCountry(ApiRequestModel(url: endPoint));
  }
}
