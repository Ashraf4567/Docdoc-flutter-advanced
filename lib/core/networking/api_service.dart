import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_advanced/core/networking/api_constants.dart';
import 'package:flutter_advanced/features/home/data/models/home_page_response.dart';
import 'package:flutter_advanced/features/home/data/models/specilizations_response.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/data/models/login_response.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody requestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody requestBody,
  );

  @GET(ApiConstants.home)
  Future<HomePageDoctorsResponse> getHomePageData();

  @GET(ApiConstants.specializations)
  Future<SpecializationsResponse> getSpecializations();
}
