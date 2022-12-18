import 'package:esp32proje/data/services/users/model/update_request.dart';
import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:get/state_manager.dart';

class ProfilController extends GetxController {
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxnString newparola = RxnString();
  final UserService _userService;
  ProfilController(this._userService);

  void callingUpdateService(String userid, String username, String email,
      String admin, String parola, String isremove) {
    final UpdateRequestModel userReguest = UpdateRequestModel(
        userid: userid,
        username: username,
        email: email,
        admin: admin,
        parola: parola,
        isremove: isremove);
    isLoading.call(true);
    _userService
        .update(userReguest)
        .then((user) {})
        .catchError((dynamic error) {
      // ignore: avoid_print
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
