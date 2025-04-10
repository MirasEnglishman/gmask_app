
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:gmask_app/core/env.dart';
import 'package:gmask_app/data/repositories/flavor_repository.dart';
import 'package:gmask_app/network/dio/flavor.dart';
import 'package:gmask_app/network/interceptors/interceptors.dart';
import 'package:gmask_app/network/interceptors/log_interceptors.dart';
import 'package:gmask_app/service_locator.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio getDio({
    required Flavor flavor,
  }) {
    final _dio = Dio()..options.baseUrl = flavor.baseApiUrl;
    // ..options.connectTimeout = 30;

    // final _dio = Dio()..options.baseUrl = flavor.baseApiUrl;

    _dio.interceptors.addAll([
      authInterceptors(_dio),
      LoggerInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
      TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
              printRequestData: true, printResponseData: true)),
    ]);

    return _dio;
  }
}

@lazySingleton
class DioService {
  final Dio dio;

  DioService(this.dio);

  Future<Response<Map<String, dynamic>>> fetch({
    required String url,
    required String method,
    ResponseType responseType = ResponseType.json,
    FormData? data,
    Map<String, dynamic>? queryParameters,
  }) =>
      dio.fetch<Map<String, dynamic>>(
        Options(
          method: method,
          responseType: responseType,
          contentType: 'multipart/form-data',
        )
            .compose(
          dio.options,
          url,
          data: data,
          queryParameters: queryParameters,
        )
            .copyWith(
          baseUrl: serviceLocator<FlavorRepository>().flavor == 'dev'
              ? restDevURL
              : restURL,
        ),
      );
}
