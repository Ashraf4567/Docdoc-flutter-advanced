

import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_constants.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUerl)
abstract class ApiService {
 factory ApiService(Dio dio ,{String? baseUrl} ) = _ApiService; 

 @POST(ApiConstants.login)
 Future<LoginResponse> login(
  @Body() LoginRequestBody requestBody,
 );

 
}