import 'package:flutter_advanced/features/home/data/models/specialization_doctors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_page_response.g.dart';

@JsonSerializable()
class HomePageResponse {
  final String message;
  final List<SpecializationDoctors> data;
  final bool status;
  final int code;

  const HomePageResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageResponseToJson(this);
}