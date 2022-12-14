// ignore_for_file: avoid_print

import 'package:esp32proje/data/services/users/model/update_request.dart';
import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:get/state_manager.dart';

class UsersController extends GetxController {
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final Rxn<List> usernamelist = Rxn();
  final Rxn<List> userMailList = Rxn();
  final Rxn<List> userRegisterDate = Rxn();
  final Rxn<List> userParolaList = Rxn();
  final Rxn<List> userIdList = Rxn();
  final Rxn<List> userRegionList = Rxn();
  final Rxn<List> userAdminList = Rxn();
  final Rxn<List> userRemoveList = Rxn();

  final RxnString newusername = RxnString();
  final RxnString newemail = RxnString();
  final RxnString newparola = RxnString();
  final RxnString newadmin = RxnString();
  final UserService _userService;
  UsersController(this._userService);

  @override
  void onInit() {
    _callingGetID();
    _callingGetusername();
    _callingGetUserMail();
    _callingGetDate();
    _callingGetParola();
    _callingGetRegion();
    _callingGetAdmin();
    _callingGetRemove();
    super.onInit();
  }

  void _callingGetusername() {
    isLoading.call(true);
    _userService.getusername().then((value) {
      usernamelist.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetUserMail() {
    isLoading.call(true);
    _userService.getUserEmail().then((value) {
      userMailList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetDate() {
    isLoading.call(true);
    _userService.getDate().then((value) {
      userRegisterDate.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetParola() {
    isLoading.call(true);
    _userService.getuserparola().then((value) {
      userParolaList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetID() {
    isLoading.call(true);
    _userService.getuserid().then((value) {
      userIdList.call(value);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetRegion() {
    isLoading.call(true);
    _userService.getuserregion().then((value) {
      userRegionList.call(value);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetAdmin() {
    isLoading.call(true);
    _userService.getuseradmin().then((value) {
      userAdminList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetRemove() {
    isLoading.call(true);
    _userService.getisRemove().then((value) {
      userRemoveList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void callingUpdateService(String userid, String username, String email,
      String admin, String parola, String isremove) {
    // ignore: no_leading_underscores_for_local_identifiers
    final UpdateRequestModel _userReguest = UpdateRequestModel(
        userid: userid,
        username: username,
        email: email,
        admin: admin,
        parola: parola,
        isremove: isremove);
    isLoading.call(true);
    _userService
        .update(_userReguest)
        .then((user) {})
        .catchError((dynamic error) {
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
