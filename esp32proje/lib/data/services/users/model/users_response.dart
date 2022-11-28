import 'dart:convert';

List<dynamic> userResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["users"]
    .map((x) => x)
    .map((x) => UserResponseModel.fromJson(x)));

class UserResponseModel {
  UserResponseModel({
    required this.userid,
    required this.username,
    required this.email,
    required this.date,
    required this.parola,
    required this.region,
    required this.admin,
    required this.isremove,
  });
  final String userid;
  final String username;
  final String email;
  final DateTime date;
  final String parola;
  final String region;
  final String admin;
  final String isremove;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        userid: json["userid"],
        username: json["username"],
        email: json["email"],
        date: DateTime.parse(json["registerdate"]),
        parola: json["parola"],
        region: json["region"],
        admin: json["admin"],
        isremove: json["isremove"],
      );
}
