
import 'package:dio/dio.dart';
import 'package:gmask_app/utils/shared_preference.dart';

authInterceptors(Dio dio) {
  int retries = 0;

Future<RequestOptions> getOptions(RequestOptions options) async {
  RequestOptions _options = options;

  String accessToken = sharedPreference.accessToken;
  String auth_pair = sharedPreference.authPair;

  // Добавляем Authorization и AUTH-PAIR только при выполнении условий
  // if (accessToken.isNotEmpty &&
  //     !_options.headers['Authorization'].toString().contains('Basic') &&
  //     _options.path != '/rest/visitor/login' &&
  //     _options.path != "/rest/visitor/activate" &&
  //     _options.path != "/rest/visitor/check" &&
  //     _options.path != "/rest/visitor/register") {
  //   _options.headers['Authorization'] = 'Bearer $accessToken';
  //   _options.headers['AUTH-PAIR'] = '$auth_pair';
  // }

  // Устанавливаем заголовок Content-Type
  if (_options.headers['Content-Type'] == null) {
    _options.headers['Content-Type'] = 'application/json';
  }

  // Устанавливаем заголовок Accept
  if (_options.headers['Accept'] == null) {
    _options.headers['Accept'] = 'application/json';
  }


  return _options;
}


  return QueuedInterceptorsWrapper(
    onRequest: (options, handler) async {
      return handler.next(await getOptions(options));
    },
    onResponse: (response, handler) {
      retries = 0;
      return handler.next(response);
    },
  
  );
}

extension _AsOptions on RequestOptions {
  Options asOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}
