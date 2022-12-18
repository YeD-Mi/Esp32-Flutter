import 'package:esp32proje/data/services/users/user_service.dart';
import 'package:esp32proje/views/admin/admin_page.dart';
import 'package:esp32proje/views/common/common_values.dart';
import 'package:esp32proje/views/profil/profil_page.dart';
import 'package:esp32proje/views/users/users_page.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/home/home_controller.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});
  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(child: Text(homeappbar)),
              InkWell(
                  onTap: () {
                    controller.onInit();
                  },
                  child: const Icon(Icons.refresh))
            ],
          ),
          backgroundColor: primaryColor,
        ),
        drawer:
            loginisadmin.obs.string == '1' ? _adminDrawer() : _buildDrawer(),
        body: _buildBody());
  }

  void _errorDialog() {
    Get.snackbar(mistaketitle, abouttxt,
        icon: const Icon(Icons.error_outline_outlined, color: primaryColor),
        colorText: borderColor,
        backgroundColor: floor,
        duration: const Duration(seconds: 4),
        titleText: const Text(
          mistaketitle,
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _buildBody() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable2(
            columnSpacing: 5,
            horizontalMargin: 2,
            minWidth: Get.width * 0.9,
            columns: const [
              DataColumn2(
                label: Text(datatableID),
              ),
              DataColumn2(
                label: Text(datatableCurrent),
              ),
              DataColumn(
                label: Text(datatableVoltage),
              ),
              DataColumn(
                label: Text(datatableTemparature),
              ),
              DataColumn2(
                label: Text(datatableDate),
              ),
            ],
            rows: List<DataRow>.generate(
                controller.dataIdList.value?.length ?? 1,
                (index) => DataRow(cells: [
                      DataCell(Text(controller.dataIdList.value?[index] ?? "")),
                      DataCell(
                          Text(controller.dataCurrentList.value?[index] ?? "")),
                      DataCell(
                          Text(controller.dataVoltageList.value?[index] ?? "")),
                      DataCell(Text(
                          controller.dataTemperatureList.value?[index] ?? "")),
                      DataCell(Text(
                          controller.dataDateList.value?[index].toString() ??
                              ""))
                    ]))),
      ),
    );
  }

  Widget _adminDrawer() {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: floor),
              currentAccountPicture:
                  const CircleAvatar(backgroundImage: AssetImage(defaultimage)),
              accountName: Text(
                welcometxt + loginuser.string,
                style: const TextStyle(color: primaryColor),
              ),
              accountEmail: Text(loginregion.string,
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
              onTap: () => Get.offAllNamed(AdminPage.routeName)),
          const Divider(),
          ListTile(
              title: const Text(
                alluserstxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: const Icon(Icons.person),
              iconColor: floor,
              onTap: () {
                Get.lazyPut<UserService>(() => UserServiceImp());
                Get.offAllNamed(UsersPage.routeName);
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
                welcometxt + loginuser.string,
                style: const TextStyle(color: primaryColor),
              ),
              accountEmail: Text(loginregion.string,
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
                profiltxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: const Icon(Icons.person_pin_rounded),
              iconColor: floor,
              onTap: () {
                Get.lazyPut<UserService>(() => UserServiceImp());
                Get.offAllNamed(ProfilPage.routeName);
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
}
