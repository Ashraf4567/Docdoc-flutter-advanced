import 'package:flutter_advanced/features/home/data/models/specialization_doctors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_page_response.g.dart';

@JsonSerializable()
class HomePageDoctorsResponse {
  final String message;
  final List<SpecializationDoctors> data;
  final bool status;
  final int code;

  const HomePageDoctorsResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory HomePageDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePageDoctorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageDoctorsResponseToJson(this);
}
