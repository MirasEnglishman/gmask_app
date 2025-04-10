// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:gmask_app/data/repositories/flavor_repository.dart' as _i801;
import 'package:gmask_app/network/dio/base/material_message_controller.dart'
    as _i628;
import 'package:gmask_app/network/dio/base/standard_error_handler.dart'
    as _i797;
import 'package:gmask_app/network/dio/dio_module.dart' as _i1017;
import 'package:gmask_app/network/dio/flavor.dart' as _i853;
import 'package:gmask_app/network/rest_client/rest_client.dart' as _i377;
import 'package:gmask_app/utils/shared_preference.dart' as _i82;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.factory<_i801.FlavorRepository>(() => _i801.FlavorRepository());
  gh.factory<_i628.MaterialMessageController>(
      () => _i628.MaterialMessageController());
  gh.factory<_i82.SharedPreferenceHelper>(() => _i82.SharedPreferenceHelper());
  gh.factory<_i853.Flavor>(() => _i853.ProdFlavor());
  gh.singleton<_i797.StandardErrorHandler>(
      () => _i797.StandardErrorHandler(gh<_i628.MaterialMessageController>()));
  gh.lazySingleton<_i361.Dio>(
      () => dioModule.getDio(flavor: gh<_i853.Flavor>()));
  gh.lazySingleton<_i1017.DioService>(() => _i1017.DioService(gh<_i361.Dio>()));
  gh.factory<_i377.RestClient>(() => _i377.RestClient(gh<_i361.Dio>()));
  return getIt;
}

class _$DioModule extends _i1017.DioModule {}
