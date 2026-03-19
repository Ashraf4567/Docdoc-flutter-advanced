import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/features/home/data/models/home_page_response.dart';
import 'package:flutter_advanced/features/home/data/models/specilizations_response.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repo.dart';
import 'package:flutter_advanced/features/home/ui/cubit/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getHomeData() async {
    emit(const HomeState.loading());

    try {
      // Make both requests concurrently
      final results = await Future.wait([
        _homeRepo.getHomePageDoctors(),
        _homeRepo.getHomePageSpecializations(),
      ]);

      final doctorsResult = results[0] as ApiResult<HomePageDoctorsResponse>;
      final specializationsResult =
          results[1] as ApiResult<SpecializationsResponse>;

      // We only emit success if both requests succeed.
      // If one fails, we can choose how to handle it. Here we emit the error of the first one that failed.
      doctorsResult.when(
        success: (doctorsData) {
          specializationsResult.when(
            success: (specializationsData) {
              emit(HomeState.success(doctorsData, specializationsData));
            },
            failure: (errorHandler) {
              emit(HomeState.error(errorHandler.apiErrorModel.message ??
                  'Failed to load specializations'));
            },
          );
        },
        failure: (errorHandler) {
          emit(HomeState.error(
              errorHandler.apiErrorModel.message ?? 'Failed to load doctors'));
        },
      );
    } catch (e) {
      emit(HomeState.error(
          'An unexpected error occurred. Please try again later.'));
    }
  }
}
