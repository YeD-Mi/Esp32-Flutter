import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/admin/admin_page.dart';
import 'package:esp32proje/views/common/common_values.dart';
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
      drawer: _buildDrawer(),
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

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: floor),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: AssetImage(defaultimage)),
              accountName: Text(
                welcometxt + loginuser(),
                style: TextStyle(color: primaryColor),
              ),
              accountEmail:
                  Text(loginregion(), style: TextStyle(color: primaryColor))),
          ListTile(
            title: Text(abouttxt, style: TextStyle(fontSize: 16, color: floor)),
            leading: Icon(Icons.info_rounded),
            iconColor: floor,
            subtitle: Text(aboutcomment,
                style: TextStyle(fontSize: 13, color: floor)),
          ),
          Divider(),
          ListTile(
              title: Text(
                adminbartxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.account_balance_rounded),
              iconColor: floor,
              onTap: () => Get.toNamed(AdminPage.routeName)),
          Divider(),
          ListTile(
              title: Text(
                alluserstxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.person),
              iconColor: floor,
              onTap: () => Get.toNamed(UsersPage.routeName)),
          Divider(),
          ListTile(
              title: Text(
                exittxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.logout_outlined),
              iconColor: floor,
              onTap: () => Get.offAllNamed(LoginPage.routeName))
        ],
      ),
    );
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
                  controller.userRegionList.value?[index] ?? "",
                  controller.userAdminList.value?[index] ?? "",
                  controller.userRemoveList.value?[index] ?? "",
                ),
              ),
            ),
          ),
          itemCount: controller.userIdList.value?.length ?? 1,
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      if (admin.toString() == 0) {
                        admin = '1';
                      } else {
                        admin = '0';
                      }
                      controller.callingUpdateService(
                          userid, username, email, admin, parola, isremove);
                      controller.onInit();
                      Get.toNamed(UsersPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(statustxt)),
                ElevatedButton(
                    onPressed: () {
                      if (isremove.toString() == '0') {
                        isremove = '1';
                      } else {
                        isremove = '0';
                      }
                      controller.callingUpdateService(
                          userid, username, email, admin, parola, isremove);
                      controller.onInit();
                      Get.toNamed(UsersPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(durumtxt)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showEditDialog(
                      userid, username, email, parola, admin, isremove);
                },
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                child: Text(edittxt)),
          ],
        ));
  }

  void showEditDialog(String userid, String username, String email,
      String parola, String admin, String isremove) {
    Get.defaultDialog(
      backgroundColor: primaryColor,
      title: "Uye Duzenle / ID: $userid",
      titleStyle: TextStyle(color: borderColor),
      content: Column(
        children: [
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
                  controller.newusername.call(value);
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
                onChanged: (eposta) {
                  controller.newemail.call(eposta);
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
                onChanged: (sifre) {
                  controller.newparola.call(sifre);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.onInit();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: borderColor,
                  ),
                  child: Text('Kapat')),
              ElevatedButton(
                  onPressed: () {
                    if (controller.newusername.string.isEmpty) {
                      controller.newusername.value = username;
                    }
                    if (controller.newemail.string.isEmpty) {
                      controller.newemail.value = email;
                    }
                    if (controller.newparola.string.isEmpty) {
                      controller.newparola.value = parola;
                    }
                    controller.callingUpdateService(
                        userid,
                        controller.newusername.obs.string,
                        controller.newemail.obs.string,
                        admin,
                        controller.newparola.obs.string,
                        isremove);
                    controller.onInit();
                    Get.toNamed(UsersPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: borderColor,
                  ),
                  child: Text('Kaydet')),
            ],
          ),
        ],
      ),
    );
  }
}
