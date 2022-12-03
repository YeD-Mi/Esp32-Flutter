import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/home/home_page.dart';
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
      appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(userappbartxt),
              Divider(),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: floor.withOpacity(0.7),
                        blurRadius: 10,
                      )
                    ],
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    cursorColor: Colors.amber,
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: searchtxt),
                  ),
                ),
              ),
            ],
          )),
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
          itemCount: controller.userMailList.value?.length ?? 1,
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
    return Padding(
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
            admin == '1' ? Text(adminstatutxt) : Text(userstatutxt),
            Divider(),
            isremove == '1' ? Text(userpassivetxt) : Text(useractivetxt),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(userid, username, email, parola, admin);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(edittxt)),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(HomePage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(deletetxt)),
              ],
            ),
          ],
        ));
  }

  void showDialog(
    String userid,
    String username,
    String email,
    String parola,
    String admin,
  ) {
    Get.defaultDialog(
      backgroundColor: primaryColor,
      title: "Uye Duzenle",
      titleStyle: TextStyle(color: borderColor),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Kullanici ID: $userid",
              style: TextStyle(color: floor),
            ),
            SizedBox(height: Get.height * 0.02),
            Text("Kullanici Adi:", style: TextStyle(color: floor)),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.05),
                child: TextField(
                  cursorColor: floor,
                  onChanged: (value) {
                    //username = value;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: username,
                    hintStyle: TextStyle(color: floor),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "Kullanici Eposta:",
              style: TextStyle(color: floor),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.05),
                child: TextField(
                  onChanged: (value) {
                    //username = value;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: email,
                    hintStyle: TextStyle(color: floor),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "Kullanici Parolasi:",
              style: TextStyle(color: floor),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.05),
                child: TextField(
                  onChanged: (value) {
                    //username = value;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: parola,
                    hintStyle: TextStyle(color: floor),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "Kullanici Yetkisi:",
              style: TextStyle(color: floor),
            ),
            Text(
              "Admin: 1 Standart Kullanici: 0",
              style: TextStyle(fontSize: 11),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.05),
                child: TextField(
                  onChanged: (value) {
                    //username = value;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: admin,
                    hintStyle: TextStyle(color: floor),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: borderColor,
                    ),
                    child: Text('Kapat')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(HomePage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: borderColor,
                    ),
                    child: Text('Kaydet')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
