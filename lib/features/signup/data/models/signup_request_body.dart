import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

enum Gender {
  @JsonValue(0)
  male,
  @JsonValue(1)
  female,
}

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final String phone;
  final Gender gender;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
