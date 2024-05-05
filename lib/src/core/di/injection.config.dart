// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_challenge/src/core/modules/dio_module.dart' as _i13;
import 'package:flutter_challenge/src/data/repositories/location_repository_impl.dart'
    as _i7;
import 'package:flutter_challenge/src/data/source/local/env_helper.dart' as _i3;
import 'package:flutter_challenge/src/data/source/remote/api_service.dart'
    as _i5;
import 'package:flutter_challenge/src/domain/repositories/location_repository.dart'
    as _i6;
import 'package:flutter_challenge/src/domain/usecases/location_detail_usecase.dart'
    as _i9;
import 'package:flutter_challenge/src/presentation/screen/home/components/countrydropdown/cubit/country_cubit.dart'
    as _i11;
import 'package:flutter_challenge/src/presentation/screen/home/components/statedropdown/cubit/state_cubit.dart'
    as _i10;
import 'package:flutter_challenge/src/presentation/screen/home/cubit/homepage_cubit.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http_mock_adapter/http_mock_adapter.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i3.EnvHelper>(() => _i3.EnvHelper());
    gh.lazySingleton<_i4.Dio>(
      () => dioModule.dio(gh<_i3.EnvHelper>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i4.Dio>(
      () => dioModule.getMockDio(gh<_i3.EnvHelper>()),
      registerFor: {_test},
    );
    gh.singleton<_i5.ApiService>(() => _i5.ApiService(dio: gh<_i4.Dio>()));
    gh.singleton<_i6.LocationRepository>(
        () => _i7.LocationRepositoryImpl(apiService: gh<_i5.ApiService>()));
    gh.lazySingleton<_i8.DioAdapter>(
        () => dioModule.setupAdapter(gh<_i4.Dio>()));
    gh.factory<_i9.LocationDetailUseCase>(() => _i9.LocationDetailUseCase(
        locationRepository: gh<_i6.LocationRepository>()));
    gh.lazySingleton<_i10.StateCubit>(() => _i10.StateCubit(
        locationDetailUseCase: gh<_i9.LocationDetailUseCase>()));
    gh.lazySingleton<_i11.CountryCubit>(
        () => _i11.CountryCubit(useCase: gh<_i9.LocationDetailUseCase>()));
    gh.singleton<_i12.HomepageCubit>(
        () => _i12.HomepageCubit(stateCubit: gh<_i10.StateCubit>()));
    return this;
  }
}

class _$DioModule extends _i13.DioModule {}
