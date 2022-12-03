import 'package:esp32proje/data/services/register/model/register_request.dart';
import 'package:esp32proje/data/services/register/model/register_response.dart';
import 'package:esp32proje/data/services/register/register_service.dart';
import 'package:get/state_manager.dart';

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
      print("Basarili");
    }).catchError((dynamic error) {
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  final List<String> list = <String>[
    'Akdeniz',
    'Ege',
    'Karadeniz',
    'Dogu',
    'Guney Dogu',
    'Marmara',
    'Ic Anadolu',
  ];

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<RegisterResponseModel> user = Rxn();
  final RegisterService _registerService;
  RegisterController(this._registerService);
}
