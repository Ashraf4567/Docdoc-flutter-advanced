import 'package:flutter_advanced/features/home/data/models/home_page_response.dart';
import 'package:flutter_advanced/features/home/data/models/specilizations_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(
    HomePageDoctorsResponse homePageDoctorsResponse,
    SpecializationsResponse specializationsResponse,
  ) = Success;
  const factory HomeState.error(String error) = Error;
}
