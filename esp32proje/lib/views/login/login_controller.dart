import 'package:esp32proje/data/services/home/home.service.dart';
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
        loginuserid.call(user.userId);
        loginuser.call(user.username);
        loginregion.call(user.region);
        loginmail.call(user.email);
        loginparola.call(user.parola);
        loginisadmin.call(user.admin);
        switch (loginregion.obs.string) {
          case 'Genel':
            Get.offAllNamed(AdminPage.routeName);
            break;
          case 'Ege':
            regionUrl.call(egeLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.offAllNamed(HomePage.routeName);
            break;
          case 'Marmara':
            regionUrl.call(marmaraLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.offAllNamed(HomePage.routeName);
            break;
          case 'Karadeniz':
            regionUrl.call(karadenizLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.toNamed(HomePage.routeName);
            break;
          case 'Dogu':
            regionUrl.call(doguLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.offAllNamed(HomePage.routeName);
            break;
          case 'Akdeniz':
            regionUrl.call(akdenizLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.offAllNamed(HomePage.routeName);
            break;
          case 'Guney Dogu':
            regionUrl.call(guneydoguLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.offAllNamed(HomePage.routeName);
            break;
          case 'Ic Anadolu':
            regionUrl.call(icAnadoluLink);
            Get.lazyPut<HomeService>(() => HomeServiceImp());
            Get.offAllNamed(HomePage.routeName);
            break;
        }
      }
      if (user.statu == 1) {
        Get.snackbar(mistaketitle, wrongPasswordtxt,
            icon: const Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: const Duration(seconds: 4),
            titleText: const Text(
              mistaketitle,
              style: TextStyle(fontSize: 20),
            ));
      }
      if (user.statu == 0) {
        Get.snackbar(mistaketitle, noUsertxt,
            icon: const Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: const Duration(seconds: 4),
            titleText: const Text(
              mistaketitle,
              style: TextStyle(fontSize: 20),
            ));
      }
      if (user.statu == 3) {
        Get.snackbar(mistaketitle, deletedusertxt,
            icon: const Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: const Duration(seconds: 4),
            titleText: const Text(
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
