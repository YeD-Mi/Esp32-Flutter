import 'package:esp32proje/data/services/register/model/register_request.dart';
import 'package:esp32proje/data/services/register/model/register_response.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:http/http.dart' as http;

abstract class RegisterService {
  Future register(RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  @override
  Future register(RegisterRequestModel registerRequestModel) async {
    final response =
        await http.post(Uri.parse(urltxt), body: registerRequestModel.toJson());

    if (response.statusCode == 200) {
      print(successfultxt);
      return registerResponseModelFromJson(response.body);
    } else {
      print(mistaketitle);
      return '';
    }
  }
}
