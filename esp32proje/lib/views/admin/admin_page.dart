import 'package:esp32proje/data/services/home/home.service.dart';
import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/admin/admin_controller.dart';
import 'package:esp32proje/views/common/common_values.dart';
import 'package:esp32proje/views/home/home_page.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/users/users_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends GetWidget<AdminController> {
  const AdminPage({super.key});
  static const String routeName = '/views/admin/admin_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: Text(adminbartxt)),
            ],
          ),
          backgroundColor: primaryColor,
        ),
        drawer: _buildDrawer(),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_ege.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.offAllNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(egeimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, top: Get.height * 0.02),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ege",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_marmara.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(marmaraimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, top: Get.height * 0.02),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Marmara",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_akdeniz.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(akdenizimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, top: Get.height * 0.02),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Akdeniz",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_karadeniz.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(karadenizimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, top: Get.height * 0.02),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Karadeniz",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_dogu.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(doguimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, top: Get.height * 0.02),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Doğu Anadolu",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_guneydogu.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(guneydoguimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, top: Get.height * 0.02),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Güneydoğu",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      regionUrl.call('http://sub.mryed.com/get_icanadolu.php');
                      Get.lazyPut<HomeService>(() => HomeServiceImp());
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.25,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        color: primaryColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              primaryColor.withOpacity(0.9), BlendMode.dstATop),
                          image: AssetImage(icimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.1, top: Get.height * 0.05),
                    child: Container(
                      color: borderColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İç Anadolu",
                          style: TextStyle(
                            fontSize: 18,
                            color: floor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
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
                adminbartxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: Icon(Icons.account_balance_rounded),
              iconColor: floor,
              onTap: () => Get.toNamed(AdminPage.routeName)),
          Divider(),
          ListTile(
              title: Text(
                alluserstxt,
                style: TextStyle(fontSize: 16, color: floor),
              ),
              leading: Icon(Icons.person),
              iconColor: floor,
              onTap: () => Get.toNamed(UsersPage.routeName)),
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
}
