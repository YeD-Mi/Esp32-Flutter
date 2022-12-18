import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  final int statu;
  final String? message;
  final String? userId;
  final String? username;
  final String? parola;
  final String? email;
  final String? admin;
  final String? region;

  LoginResponseModel.fromJson(Map<dynamic, dynamic> json)
      : statu = json["STATU"],
        message = json["MESSAGE"],
        userId = json["USER_ID"],
        username = json["USER_NAME"],
        parola = json["PAROLA"],
        email = json["EMAIL"],
        admin = json["ADMIN"],
        region = json["REGION"];
}
