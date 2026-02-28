
import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String phone,
    Gender gender,
  ) async {
    try {
      final response = await _apiService.signup(
        SignupRequestBody(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          phone: phone,
          gender: gender,
        ),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  } 
}