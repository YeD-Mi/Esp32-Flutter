import 'package:esp32proje/data/services/login/login_service.dart';
import 'package:esp32proje/data/services/login/model/login_request.dart';
import 'package:esp32proje/data/services/login/model/login_response.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/admin/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/common_values.dart';
import '../home/home_page.dart';

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

    isLoading.call(true);

    _loginService.login(requestModel).then((user) {
      if (user.statu == 2) {
        isLogin.call(true);
        loginuser.value = user.username;
        loginregion.value = user.region;
        print(user.region);
        switch (user.region) {
          case 'Genel':
            Get.toNamed(AdminPage.routeName);
            break;
          case 'Ege':
            regionUrl.call('http://sub.mryed.com/esp32/get_ege.php');
            Get.toNamed(HomePage.routeName);
            break;
          case 'Marmara':
            regionUrl.call('http://sub.mryed.com/esp32/get_marmara.php');
            Get.toNamed(HomePage.routeName);
            break;
          case 'Karadeniz':
            regionUrl.call('http://sub.mryed.com/esp32/get_karadeniz.php');
            Get.toNamed(HomePage.routeName);
            break;
          case 'Dogu':
            regionUrl.call('http://sub.mryed.com/esp32/get_dogu.php');
            Get.toNamed(HomePage.routeName);
            break;
          case 'Akdeniz':
            regionUrl.call('http://sub.mryed.com/esp32/get_akdeniz.php');
            Get.toNamed(HomePage.routeName);
            break;
          case 'Guney Dogu':
            regionUrl.call('http://sub.mryed.com/esp32/get_guneydogu.php');
            Get.toNamed(HomePage.routeName);
            break;
          case 'Ic Anadolu':
            regionUrl.call('http://sub.mryed.com/esp32/get_icanadolu.php');
            Get.toNamed(HomePage.routeName);
            break;
        }
      }
      if (user.statu == 1) {
        Get.snackbar(mistaketitle, wrongPasswordtxt,
            icon: Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: Duration(seconds: 4),
            titleText: Text(
              mistaketitle,
              style: TextStyle(fontSize: 20),
            ));
      }
      if (user.statu == 0) {
        Get.snackbar(mistaketitle, noUsertxt,
            icon: Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: Duration(seconds: 4),
            titleText: Text(
              mistaketitle,
              style: TextStyle(fontSize: 20),
            ));
      }
      if (user.statu == 3) {
        Get.snackbar(mistaketitle, deletedusertxt,
            icon: Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: Duration(seconds: 4),
            titleText: Text(
              mistaketitle,
              style: TextStyle(fontSize: 20),
            ));
      }
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
