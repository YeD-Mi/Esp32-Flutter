import 'package:esp32proje/views/admin/admin_page.dart';
import 'package:esp32proje/views/home/home_page.dart';
import 'package:esp32proje/views/profil/profil_page.dart';
import 'package:esp32proje/views/users/users_page.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/register/register_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
  GetPage(name: HomePage.routeName, page: () => HomePage()),
  GetPage(name: UsersPage.routeName, page: () => UsersPage()),
  GetPage(name: AdminPage.routeName, page: () => AdminPage()),
  GetPage(name: ProfilPage.routeName, page: () => ProfilPage()),
];
