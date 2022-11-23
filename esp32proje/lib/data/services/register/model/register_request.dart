import 'dart:convert';

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  final String username;
  final String email;
  final String region;
  final String parola;

  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.region,
    required this.parola,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "region": region,
        "parola": parola,
      };
}
