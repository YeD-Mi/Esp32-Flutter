import 'package:esp32proje/data/services/home/home.service.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/common/common_values.dart';
import 'package:esp32proje/views/home/home_page.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/profil/profil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPage extends GetWidget<ProfilController> {
  const ProfilPage({super.key});
  static const String routeName = '/views/profil/profil_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text(profilappbartxt)),
            ],
          )),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  void _errorDialog(
      String title, String message, IconData iconum, Color colorum) {
    Get.snackbar(title, message,
        icon: Icon(iconum, color: colorum),
        colorText: borderColor,
        backgroundColor: floor,
        duration: Duration(seconds: 3),
        titleText: Text(
          title,
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
                loginregion.obs.string + " Verileri",
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: Icon(Icons.home),
              iconColor: floor,
              onTap: () {
                Get.lazyPut<HomeService>(() => HomeServiceImp());
                Get.offAllNamed(HomePage.routeName);
              }),
          Divider(),
          ListTile(
              title: Text(
                exittxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: Icon(Icons.logout_outlined),
              iconColor: floor,
              onTap: () => Get.offAllNamed(LoginPage.routeName))
        ],
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: _buildCard(),
          ),
        ),
      ),
      itemCount: 1,
    );
  }

  Widget _buildCard() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Uye No: $loginuserid ",
            ),
            Divider(),
            Text(
              "Kullanici Adi: $loginuser",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text(
              "E-Posta Adresi: $loginmail",
            ),
            Divider(),
            Text(
              "Parola: $loginparola",
            ),
            Divider(),
            loginisadmin == '1' ? Text(adminstatutxt) : Text(userstatutxt),
            Divider(),
            Text(
              "Bolge: $loginregion",
            ),
            Divider(),
            ElevatedButton(
                onPressed: () {
                  showEditDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                child: Text(edittxt)),
          ],
        ));
  }

  void showEditDialog() {
    Get.defaultDialog(
      backgroundColor: primaryColor,
      title: "Uye Duzenle / ID: $loginuserid",
      titleStyle: TextStyle(color: borderColor),
      content: Column(
        children: [
          Text("Kullanici Adi: $loginuser", style: TextStyle(color: floor)),
          SizedBox(height: Get.height * 0.02),
          Text(
            "Kullanici Eposta: $loginmail",
            style: TextStyle(color: floor),
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
                  hintText: loginparola.obs.string,
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
                  child: Text(backtxt)),
              ElevatedButton(
                  onPressed: () {
                    if (controller.newparola.obs.string ==
                            loginparola.obs.string ||
                        controller.newparola.toString() == 'null') {
                      _errorDialog(mistaketitle, editpasswordtxt,
                          Icons.error_outline_outlined, primaryColor);
                    } else {
                      _errorDialog(passwordnewtxt, againlogintxt,
                          Icons.add_task_outlined, positiveclr);
                      controller.callingUpdateService(
                          loginuserid.obs.string,
                          loginuser.obs.string,
                          loginmail.obs.string,
                          loginisadmin.obs.string,
                          controller.newparola.obs.string,
                          "0");
                      Get.offAllNamed(LoginPage.routeName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: borderColor,
                  ),
                  child: Text(savetxt)),
            ],
          ),
        ],
      ),
    );
  }
}
