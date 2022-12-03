import 'package:esp32proje/data/services/home/home.service.dart';
import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:esp32proje/views/admin/admin_controller.dart';
import 'package:esp32proje/views/users/users_controller.dart';
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
  Get.create(() => HomeController(Get.find()), permanent: false);
  Get.create(() => UsersController(Get.find()), permanent: false);
  Get.create(() => AdminController(), permanent: false);

  //Services
  Get.lazyPut<UserService>(() => UserServiceImp());
  Get.lazyPut<RegisterService>(() => RegisterServiceImp());
  Get.lazyPut<LoginService>(() => LoginServiceImp());
  Get.lazyPut<HomeService>(() => HomeServiceImp());
}
