import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced/core/networking/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio(
    AuthInterceptor authInterceptor,
  ) {
    Duration connectTimeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio?.options.connectTimeout = connectTimeout;
      dio?.options.receiveTimeout = connectTimeout;
      addDioInterceptior(authInterceptor);
      return dio!;
    }
    return dio!;
  }

  static void addDioInterceptior(AuthInterceptor authInterceptor) {
    dio!.interceptors.add(authInterceptor);
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          // if (options.path.contains('/posts')) {
          //   return false;
          // }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
  }
}
