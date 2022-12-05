import 'dart:convert';

String updateRequestModelToJson(UpdateRequestModel data) =>
    json.encode(data.toJson());

class UpdateRequestModel {
  final String userid;
  final String username;
  final String email;
  final String admin;
  final String parola;
  final String isremove;

  UpdateRequestModel({
    required this.userid,
    required this.username,
    required this.email,
    required this.admin,
    required this.parola,
    required this.isremove,
  });

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "username": username,
        "email": email,
        "admin": admin,
        "parola": parola,
        "isremove": isremove,
      };
}
