import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {

  final ISecureStorage _secureStorage;
  AuthInterceptor(this._secureStorage);


  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _addTokenIfNeeded(options);
    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
  }
  
  Future<void> _addTokenIfNeeded(RequestOptions options) async {

    if(options.headers['Authorization'] != null) {
      return;
    }

    final token = await _secureStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
  }
}
