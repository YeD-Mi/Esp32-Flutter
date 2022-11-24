import 'package:esp32proje/data/services/login/login_service.dart';
import 'package:esp32proje/data/services/login/model/login_request.dart';
import 'package:esp32proje/data/services/login/model/login_response.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isLogin = RxBool(false);
  final RxnString errorTexts = RxnString();
  final Rxn<LoginResponseModel> user = Rxn();
  final LoginService _loginService;
  LoginController(this._loginService);

  void callingLoginService(String username, String parola) {
    final LoginRequestModel requestModel =
        LoginRequestModel(username: username, parola: parola);
    print("Burasi Calling");

    isLoading.call(true);

    _loginService.login(requestModel).then((user) {
      if (user.statu == 2) {
        isLogin.call(true);
      }
      if (user.statu == 1) errorTexts.value = wrongPasswordtxt;
      if (user.statu == 0) errorTexts.value = noUsertxt;
      // userId.value = user.userId;
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
