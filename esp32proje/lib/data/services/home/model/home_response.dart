import 'dart:convert';

List<dynamic> homeResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["data"]
    .map((x) => x)
    .map((x) => HomeResponseModel.fromJson(x)));

class HomeResponseModel {
  HomeResponseModel({
    required this.id,
    required this.volt,
    required this.amper,
    required this.sicaklik,
    required this.date,
  });
  final String id;
  final String volt;
  final String amper;
  final String sicaklik;
  final DateTime date;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        id: json["id"],
        sicaklik: json["sicaklik"],
        volt: json["volt"],
        amper: json["amper"],
        date: DateTime.parse(json["date"]),
      );
}
