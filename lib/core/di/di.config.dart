// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/data_sources/remote_data_source/home_remote_data.dart'
    as _i266;
import '../../features/home/data/data_sources/remote_data_source/home_remote_data_impl.dart'
    as _i9;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../utlis/services/api_services.dart' as _i862;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i862.ApiService>(() => _i862.ApiService());
    gh.factory<_i266.HomeRemoteData>(
      () => _i9.HomeRemoteDataImpl(apiService: gh<_i862.ApiService>()),
    );
    gh.factory<_i0.HomeRepository>(
      () => _i76.HomeRepositoryImpl(remoteData: gh<_i266.HomeRemoteData>()),
    );
    return this;
  }
}
