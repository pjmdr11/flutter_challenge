import '../../data/models/app_exception_model.dart';

abstract class DataState<T> {
  final T? data;
  final AppException? appException;

  const DataState({this.data, this.appException});
}

class ResultSuccess<T> extends DataState<T> {
  const ResultSuccess(T data) : super(data: data);
}

class ResultFailure<T> extends DataState<T> {
  const ResultFailure(AppException e) : super(appException: e);
}

class ResultNotSet<T> extends DataState<T> {
  const ResultNotSet();
}
