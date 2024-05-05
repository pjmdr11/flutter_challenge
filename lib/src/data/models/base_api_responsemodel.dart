import 'package:flutter/foundation.dart';
import 'package:flutter_challenge/src/core/resources/data_state.dart';
import 'package:flutter_challenge/src/core/utils/error_utils.dart';

abstract class BaseApiResponseModel {
  @protected
  Future<DataState<T>> getStateOf<T>(
      {required Future<dynamic> Function() request,
      required Function jsonToModel}) async {
    try {
      final response = await request();
      return ResultSuccess(jsonToModel(response));
    } catch (e) {
      return ResultFailure(ErrorUtils.generateErrorDetails(e));
    }
  }
}
