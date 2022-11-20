import 'package:esp32proje/views/home/home_controller.dart';
import 'package:esp32proje/views/login/login_controller.dart';
import 'package:esp32proje/views/register/register_controller.dart';
import 'package:get/get.dart';

Future getControllers() async {
  Get.create(() => LoginController(), permanent: false);
  Get.create(() => RegisterController(), permanent: false);
  Get.create(() => HomeController(), permanent: false);
}
