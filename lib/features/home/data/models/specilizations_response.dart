import 'package:flutter_advanced/features/home/data/models/specialization_doctors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specilizations_response.g.dart';

@JsonSerializable()
class SpecializationsResponse {
  final String message;
  @JsonKey(name: 'data')
  final List<SpecializationDoctors> doctors;
  final bool status;
  final int code;

  const SpecializationsResponse({
    required this.message,
    required this.doctors,
    required this.status,
    required this.code,
  });

  factory SpecializationsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseFromJson(json);

}