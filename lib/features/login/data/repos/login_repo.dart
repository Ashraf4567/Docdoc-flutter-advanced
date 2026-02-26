import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/data/models/login_response.dart';

class LoginRepo {
 final ApiService _apiService;

 LoginRepo(this._apiService);
 
 Future<ApiResult<LoginResponse>> login(
  String email,
  String password,
 ) async { 
  try {
    final response = await _apiService.login(LoginRequestBody(email: email, password: password));
    return ApiResult.success(response);
  } catch (e) {
    return ApiResult.failure(ErrorHandler.handle(e));
  }
 }
   
}