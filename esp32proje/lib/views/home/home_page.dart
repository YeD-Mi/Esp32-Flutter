import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/home/home_controller.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});
  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(homeappbar)),
          backgroundColor: primaryColor,
        ),
        drawer: _buildDrawer(),
        body: _buildBody());
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Cihaz $index'),
          ),
        ),
      ),
      itemCount: 5,
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
                settingstxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              //Sonuna icon eklemek istersek leading yerine; trailing kullanılır.
              leading: Icon(Icons.settings_applications_rounded),
              iconColor: floor,
              onTap: () => Get.offNamed(LoginPage.routeName)),
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
