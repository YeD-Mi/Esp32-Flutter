import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/admin/admin_page.dart';
import 'package:esp32proje/views/common/common_values.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends GetWidget<UsersController> {
  const UsersPage({super.key});
  static const String routeName = '/views/users/users_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) =>
        _errorDialog(mistaketitle, error, Icons.error, primaryColor));
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(userappbartxt),
              const Divider(),
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
                    onChanged: (value) {},
                    decoration: const InputDecoration(
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
              title: const Text(
                adminbartxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: const Icon(Icons.account_balance_rounded),
              iconColor: floor,
              onTap: () => Get.toNamed(AdminPage.routeName)),
          const Divider(),
          ListTile(
              title: const Text(
                alluserstxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: const Icon(Icons.person),
              iconColor: floor,
              onTap: () => Get.toNamed(UsersPage.routeName)),
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
            const Divider(),
            Text(
              "Kullanici Adi: $username",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              "E-Posta Adresi: $email",
            ),
            const Divider(),
            Text(
              "Kayit Tarihi: $date",
            ),
            const Divider(),
            Text(
              "Sifre: $parola",
            ),
            const Divider(),
            Text(
              "Bolge: $region",
            ),
            const Divider(),
            admin == '1' ? const Text(adminstatutxt) : const Text(userstatutxt),
            const Divider(),
            isremove == '1'
                ? const Text(userpassivetxt)
                : const Text(useractivetxt),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // ignore: unrelated_type_equality_checks
                      if (admin.toString() == '0') {
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
                      backgroundColor: primaryColor,
                    ),
                    child: const Text(statustxt)),
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
                      backgroundColor: primaryColor,
                    ),
                    child: const Text(durumtxt)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showEditDialog(
                      userid, username, email, parola, admin, isremove);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: const Text(edittxt)),
          ],
        ));
  }

  void showEditDialog(String userid, String username, String email,
      String parola, String admin, String isremove) {
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: primaryColor,
      title: "Uye Duzenle / ID: $userid",
      titleStyle: const TextStyle(color: borderColor),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Kullanici Adi:", style: TextStyle(color: floor)),
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
                    hintStyle: const TextStyle(color: floor),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            const Text(
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
                    hintStyle: const TextStyle(color: floor),
                  ),
                ),
              ),
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
                    hintText: parola,
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
                    child: const Text(closetxt)),
                ElevatedButton(
                    onPressed: () {
                      if (controller.newusername.toString() == 'null') {
                        controller.newusername.value = username;
                      }
                      if (controller.newemail.toString() == 'null') {
                        controller.newemail.value = email;
                      }
                      if (controller.newparola.toString() == 'null') {
                        controller.newparola.value = parola;
                      }
                      controller.callingUpdateService(
                          userid,
                          controller.newusername.obs.string,
                          controller.newemail.obs.string,
                          admin,
                          controller.newparola.obs.string,
                          isremove);
                      Get.lazyPut<UserService>(() => UserServiceImp());
                      controller.onInit();
                      _errorDialog(editusertxt1, editusertxt2,
                          Icons.verified_rounded, positiveclr);
                      Get.toNamed(UsersPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: borderColor,
                    ),
                    child: const Text(savetxt)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
