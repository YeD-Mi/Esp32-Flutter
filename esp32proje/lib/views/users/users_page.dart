import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/home/home_page.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends GetWidget<UsersController> {
  const UsersPage({super.key});
  static const String routeName = '/views/users/users_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Kullanicilar"))),
      body: _buildBody(),
    );
  }

  void _errorDialog() {
    Get.snackbar(mistaketitle, abouttxt,
        icon: Icon(Icons.error_outline_outlined, color: primaryColor),
        colorText: borderColor,
        backgroundColor: floor,
        duration: Duration(seconds: 4),
        titleText: Text(
          mistaketitle,
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _buildBody() {
    String dene3 = "aptal";
    return Obx(() => ListView.builder(
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: _buildCard(
                  controller.userIdList.value?[index] ?? "",
                  controller.usernamelist.value?[index] ?? "",
                  controller.userMailList.value?[index] ?? "",
                  controller.userRegisterDate.value?[index].toString() ?? "",
                  controller.userParolaList.value?[index] ?? "",
                  controller.userRegion.value?[index] ?? "",
                  controller.userAdmin.value?[index] ?? "",
                  controller.userRemove.value?[index] ?? "",
                ),
              ),
            ),
          ),
          itemCount: controller.userMailList.value?.length ?? 0,
        ));
  }

  Widget _buildCard(
    String userid,
    String username,
    String email,
    String date,
    String parola,
    String region,
    String admin,
    String isremove,
  ) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Uye No: $userid",
              ),
              Divider(),
              Text(
                "Kullanici Adi: $username",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                "E-Posta Adresi: $email",
              ),
              Divider(),
              Text(
                "Kayit Tarihi: $date",
              ),
              Divider(),
              Text(
                "Sifre: $parola",
              ),
              Divider(),
              Text(
                "Bolge: $region",
              ),
              Divider(),
              admin == '1'
                  ? Text("Statu: Yonetici")
                  : Text("Statu: Standart Kullanici"),
              Divider(),
              isremove == '1' ? Text("Durum: Pasif") : Text("Durum: Aktif"),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(HomePage.routeName);
                      },
                      child: Text("Düzenle")),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(HomePage.routeName);
                      },
                      child: Text("Sil")),
                ],
              ),
            ],
          )),
    );
  }
}
