import 'package:flutter_advanced/features/home/data/models/governrate_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  final GovernrateModel governrate;

  const CityModel({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}