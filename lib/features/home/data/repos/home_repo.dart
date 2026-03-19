import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/features/home/data/models/home_page_response.dart';
import 'package:flutter_advanced/features/home/data/models/specilizations_response.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<ApiResult<HomePageDoctorsResponse>> getHomePageDoctors() async {
    try {
      final response = await _apiService.getHomePageData();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SpecializationsResponse>>
      getHomePageSpecializations() async {
    try {
      final response = await _apiService.getSpecializations();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
