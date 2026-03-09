import 'package:json_annotation/json_annotation.dart';

part 'governrate_model.g.dart';

@JsonSerializable()
class GovernrateModel {
  final int id;
  final String name;

  const GovernrateModel({required this.id, required this.name});

  factory GovernrateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernrateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GovernrateModelToJson(this);
}