import 'package:esp32proje/views/admin/admin_page.dart';
import 'package:esp32proje/views/common/common_values.dart';
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
              Center(child: Text(homeappbar)),
              InkWell(
                  onTap: () {
                    controller.onInit();
                  },
                  child: Icon(Icons.refresh))
            ],
          ),
          backgroundColor: primaryColor,
        ),
        drawer: loginregion == 'Genel' //Değer 0 ise ResultPage açılır.
            ? _adminDrawer()
            : _buildDrawer(),
        body: _buildBody());
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
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => DataTable2(
              columnSpacing: 5,
              horizontalMargin: 2,
              minWidth: Get.width * 0.9,
              columns: [
                DataColumn2(
                  label: Text('ID'),
                ),
                DataColumn2(
                  label: Text('Amper'),
                ),
                DataColumn(
                  label: Text('Volt'),
                ),
                DataColumn(
                  label: Text('Sıcaklık'),
                ),
                DataColumn2(
                  label: Text('Tarih'),
                ),
              ],
              rows: List<DataRow>.generate(
                  controller.dataDateList.value?.length ?? 0,
                  (index) => DataRow(cells: [
                        DataCell(
                            Text(controller.dataIdList.value?[index] ?? "")),
                        DataCell(Text(
                            controller.dataCurrentList.value?[index] ?? "")),
                        DataCell(Text(
                            controller.dataVoltageList.value?[index] ?? "")),
                        DataCell(Text(
                            controller.dataTemperatureList.value?[index] ??
                                "")),
                        DataCell(Text(
                            controller.dataDateList.value?[index].toString() ??
                                ""))
                      ]))),
        ));
  }

  Widget _adminDrawer() {
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
              onTap: () => Get.offNamed(LoginPage.routeName))
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
                exittxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.logout_outlined),
              iconColor: floor,
              onTap: () => Get.offNamed(LoginPage.routeName))
        ],
      ),
    );
  }
}
