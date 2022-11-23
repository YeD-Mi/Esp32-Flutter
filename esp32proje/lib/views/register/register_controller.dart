import 'package:esp32proje/data/services/register/model/register_request.dart';
import 'package:esp32proje/data/services/register/model/register_response.dart';
import 'package:esp32proje/data/services/register/register_service.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RegisterController extends GetxController {
  void callingRegisterService(
      String username, String email, String region, String parola) {
    final RegisterRequestModel _userReguest = RegisterRequestModel(
      username: username,
      email: email,
      region: region,
      parola: parola,
    );
    isLoading.call(true);
    _registerService.register(_userReguest).then((user) {
      isRegister.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  final List<String> list = <String>[
    'Akdeniz',
    'Ege',
    'Karadeniz',
    'Dogu',
    'Güney Dogu',
    'Marmara',
    'Ic Anadolu',
  ];

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isRegister = RxBool(false);
  final Rxn<RegisterResponseModel> user = Rxn();
  final RegisterService _registerService;
  RegisterController(this._registerService);
}
