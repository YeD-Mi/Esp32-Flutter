import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/login/login_controller.dart';
import 'package:esp32proje/views/register/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/views/login/login_page';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(loginappbar)),
          backgroundColor: primaryColor,
        ),
        body: _buildBody());
  }
}

Widget _buildBody() {
  return Stack(
    children: [_buildImage(), _buildLoginForm()],
  );
}

Widget _buildImage() {
  return Container(
    width: Get.width,
    height: Get.height,
    decoration: BoxDecoration(
      color: primaryColor,
      image: DecorationImage(
        colorFilter:
            ColorFilter.mode(primaryColor.withOpacity(0.9), BlendMode.dstATop),
        image: AssetImage(electric),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildLoginForm() {
  return Padding(
    padding: EdgeInsets.only(
        bottom: Get.height * 0.07,
        left: Get.width * 0.1,
        right: Get.width * 0.1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 10,
                  )
                ],
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: LoginController().usernameController,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  hintText: usernametxt),
            )),
        SizedBox(height: Get.height * 0.005),
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 10,
                  )
                ],
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: LoginController().passwordController,
              obscureText: true,
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  hintText: passwordtxt),
            )),
        SizedBox(height: Get.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                  primary: primaryColor,
                  shape: StadiumBorder(),
                  side: BorderSide(color: borderColor, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    loginbutton,
                    style: TextStyle(fontSize: 16),
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.offNamed(RegisterPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                  primary: primaryColor,
                  shape: StadiumBorder(),
                  side: BorderSide(color: borderColor, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    signupbutton,
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
      ],
    ),
  );
}