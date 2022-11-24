import 'package:esp32proje/data/services/login/model/login_request.dart';
import 'package:esp32proje/data/services/login/model/login_response.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:http/http.dart' as http;

abstract class LoginService {
  Future login(LoginRequestModel loginRequestModel);
}

class LoginServiceImp extends LoginService {
  @override
  Future login(LoginRequestModel loginRequestModel) async {
    final response =
        await http.post(Uri.parse(loginUrl), body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      print("Kayıt Basarili");
      return loginResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}
