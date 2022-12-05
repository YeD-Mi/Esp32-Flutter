import 'dart:convert';

UpdateResponseModel updateResponseModelFromJson(String str) =>
    UpdateResponseModel.fromJson(json.decode(str));

class UpdateResponseModel {
  final bool statu;
  final String message;

  UpdateResponseModel.fromJson(Map<String, dynamic> json)
      : statu = json["STATU"],
        message = json["MESSAGE"];
}
