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
            children: const [
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
        duration: const Duration(seconds: 3),
        titleText: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ));
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: floor),
              currentAccountPicture:
                  const CircleAvatar(backgroundImage: AssetImage(defaultimage)),
              accountName: Text(
                welcometxt + loginuser(),
                style: const TextStyle(color: primaryColor),
              ),
              accountEmail: Text(loginregion(),
                  style: const TextStyle(color: primaryColor))),
          const ListTile(
            title: Text(abouttxt, style: TextStyle(fontSize: 16, color: floor)),
            leading: Icon(Icons.info_rounded),
            iconColor: floor,
            subtitle: Text(aboutcomment,
                style: TextStyle(fontSize: 13, color: floor)),
          ),
          const Divider(),
          ListTile(
              title: Text(
                "${loginregion.obs.string} Verileri",
                style: const TextStyle(fontSize: 16, color: floor),
              ),
              leading: const Icon(Icons.home),
              iconColor: floor,
              onTap: () {
                Get.lazyPut<HomeService>(() => HomeServiceImp());
                Get.offAllNamed(HomePage.routeName);
              }),
          const Divider(),
          ListTile(
              title: const Text(
                exittxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: const Icon(Icons.logout_outlined),
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
            const Divider(),
            Text(
              "Kullanici Adi: $loginuser",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              "E-Posta Adresi: $loginmail",
            ),
            const Divider(),
            Text(
              "Parola: $loginparola",
            ),
            const Divider(),
            // ignore: unrelated_type_equality_checks
            loginisadmin == '1'
                ? const Text(adminstatutxt)
                : const Text(userstatutxt),
            const Divider(),
            Text(
              "Bolge: $loginregion",
            ),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  showEditDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: const Text(edittxt)),
          ],
        ));
  }

  void showEditDialog() {
    Get.defaultDialog(
      backgroundColor: primaryColor,
      title: "Uye Duzenle / ID: $loginuserid",
      titleStyle: const TextStyle(color: borderColor),
      content: Column(
        children: [
          Text("Kullanici Adi: $loginuser",
              style: const TextStyle(color: floor)),
          SizedBox(height: Get.height * 0.02),
          Text(
            "Kullanici Eposta: $loginmail",
            style: const TextStyle(color: floor),
          ),
          SizedBox(height: Get.height * 0.02),
          const Text(
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
                  hintStyle: const TextStyle(color: floor),
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
                    backgroundColor: borderColor,
                  ),
                  child: const Text(backtxt)),
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
                    backgroundColor: borderColor,
                  ),
                  child: const Text(savetxt)),
            ],
          ),
        ],
      ),
    );
  }
}
