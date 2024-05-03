import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  String email;
  @JsonKey(name: 'password')
  String passowrd;

  LoginData(this.email, this.passowrd);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
