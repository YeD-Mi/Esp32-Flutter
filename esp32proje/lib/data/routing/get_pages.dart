import 'package:esp32proje/views/home/home_page.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/register/register_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
  GetPage(
    name: RegisterPage.routeName,
    page: () => const RegisterPage(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
  )
];
