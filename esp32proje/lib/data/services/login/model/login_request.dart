import 'dart:convert';

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  final String username;
  final String parola;

  LoginRequestModel({
    required this.username,
    required this.parola,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "parola": parola,
      };
}
