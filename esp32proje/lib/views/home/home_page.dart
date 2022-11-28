import 'package:esp32proje/views/users/users_page.dart';
import 'package:esp32proje/views/profile/profile_page.dart';
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
          title: Center(child: Text(homeappbar)),
          backgroundColor: primaryColor,
        ),
        drawer: _buildDrawer(),
        body: _deneme());
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
    return ListView.builder(
        itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _buildCard(
                      controller.dataIdList.value?[index] ?? "",
                      controller.dataCurrentList.value?[index] ?? "",
                      controller.dataVoltageList.value?[index] ?? "",
                      controller.dataTemperatureList.value?[index] ?? "",
                      controller.dataDateList.value?[index].toString() ?? ""),
                ),
              ),
            ),
        itemCount: 4
        //controller.dataDateList.value?.length ?? 0,
        );
  }

  Widget _deneme() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
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
              controller.dataIdList.value!.length,
              (index) => DataRow(cells: [
                    DataCell(Text(controller.dataIdList.value?[index])),
                    DataCell(Text(controller.dataCurrentList.value?[index])),
                    DataCell(Text(controller.dataVoltageList.value?[index])),
                    DataCell(
                        Text(controller.dataTemperatureList.value?[index])),
                    DataCell(
                        Text(controller.dataDateList.value![index].toString()))
                  ]))),
    );
  }

  Widget _buildCard(
    String id,
    String amper,
    String volt,
    String sicaklik,
    String date,
  ) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "ID: $id",
                ),
                Divider(),
                Text(
                  "Akım: $amper",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text(
                  "Volt: $volt",
                ),
                Divider(),
                Text(
                  "Derece: $sicaklik",
                ),
              ],
            ),
            Divider(),
            Text(
              "Kayit Tarihi: $date",
            ),
          ],
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
                "Kullanıcı Adı",
                style: TextStyle(color: primaryColor),
              ),
              accountEmail: Text("Kullanıcı Maili",
                  style: TextStyle(color: primaryColor))),
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
                profiltxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.edit_note_outlined),
              iconColor: floor,
              onTap: () => Get.toNamed(ProfilePage.routeName)),
          Divider(),
          ListTile(
              title: Text(
                alluserstxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.settings_applications_rounded),
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
}
