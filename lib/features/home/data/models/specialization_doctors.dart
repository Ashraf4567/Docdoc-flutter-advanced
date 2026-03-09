import 'package:flutter_advanced/features/home/data/models/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specialization_doctors.g.dart';

@JsonSerializable()
class SpecializationDoctors {
  final int id;
  final String name;
  final List<DoctorModel> doctors;

  const SpecializationDoctors({required this.id, required this.name, required this.doctors});

  factory SpecializationDoctors.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDoctorsFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationDoctorsToJson(this);
}