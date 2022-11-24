import 'package:esp32proje/data/services/login/login_service.dart';
import 'package:esp32proje/data/services/register/register_service.dart';
import 'package:esp32proje/views/home/home_controller.dart';
import 'package:esp32proje/views/login/login_controller.dart';
import 'package:esp32proje/views/register/register_controller.dart';
import 'package:get/get.dart';

Future getControllers() async {
  //Pages
  Get.create(() => LoginController(Get.find()), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(), permanent: false);

  //Services
  Get.lazyPut<RegisterService>(() => RegisterServiceImp());
  Get.lazyPut<LoginService>(() => LoginServiceImp());
}
