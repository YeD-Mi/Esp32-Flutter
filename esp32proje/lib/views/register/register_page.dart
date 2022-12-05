import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:esp32proje/views/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String dropdownValue = RegisterController(Get.find()).list.last;
String username = "";
String eposta = "";
String password = "";
String againpassword = "";

class RegisterPage extends GetWidget<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);
  static const String routeName = '/views/register/register_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text(registerapptxt)),
          backgroundColor: primaryColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(Get.height * 0.01),
            child: _buildImage(),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: Get.height * 0.03,
                left: Get.height * 0.02,
                right: Get.height * 0.02,
                top: Get.height * 0.02),
            child: _buildRegisterForm(),
          ),
          DropdownRegion(),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(250),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 15, 3),
            child: TextField(
              onChanged: (value) {
                eposta = value;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: registermail),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 15, 3),
            child: TextField(
              onChanged: (value) {
                username = value;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: registernick),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 15, 3),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: registerpassword),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(250),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 15, 3),
            child: TextField(
              onChanged: (value) {
                againpassword = value;
              },
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: againpasswordtxt),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: Get.height * 0.27,
          decoration: BoxDecoration(
            color: primaryColor,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  primaryColor.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage(lamp),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: ElevatedButton(
              onPressed: () => _onTap(),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(2),
                primary: primaryColor,
                shape: StadiumBorder(),
                side: BorderSide(color: borderColor, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  signupbutton,
                  style: const TextStyle(fontSize: 18),
                ),
              )),
        ),
      ],
    );
  }

  void _onTap() {
    if (username.isNotEmpty &&
        eposta.isNotEmpty &&
        dropdownValue.isNotEmpty &&
        password.isNotEmpty) {
      if (password == againpassword) {
        RegisterController(Get.find()).callingRegisterService(
          username,
          eposta,
          dropdownValue,
          password,
        );
        Get.snackbar(welcometxt + username, successfultxt,
            icon: Icon(Icons.back_hand_outlined, color: positiveclr),
            colorText: borderColor,
            backgroundColor: floor,
            duration: Duration(seconds: 4),
            titleText: Text(
              welcometxt + username,
              style: TextStyle(fontSize: 20),
            ));
        Get.offAndToNamed(LoginPage.routeName);
      } else {
        Get.snackbar(mistaketitle, passworderror,
            icon: Icon(Icons.error_outline_outlined, color: primaryColor),
            colorText: borderColor,
            backgroundColor: floor,
            duration: Duration(seconds: 4),
            titleText: Text(
              mistaketitle,
              style: TextStyle(fontSize: 20),
            ));
      }
    } else {
      Get.snackbar(mistaketitle, mistakecomment,
          icon: Icon(Icons.error_outline_outlined, color: primaryColor),
          colorText: borderColor,
          backgroundColor: floor,
          duration: Duration(seconds: 4),
          titleText: Text(
            mistaketitle,
            style: TextStyle(fontSize: 20),
          ));
    }
  }
}

class DropdownRegion extends StatefulWidget {
  const DropdownRegion({super.key});
  @override
  State<DropdownRegion> createState() => _DropdownButton();
}

class _DropdownButton extends State<DropdownRegion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Get.height * 0.01,
          left: Get.width * 0.2,
          right: Get.width * 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: Padding(
              padding: EdgeInsets.only(left: Get.width * 0.32),
              child: const Icon(
                Icons.arrow_downward,
              ),
            ),
            elevation: 10,
            style: const TextStyle(color: borderColor, fontSize: 16),
            underline: Container(
              height: 2,
              color: primaryColor,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
                print(dropdownValue);
              });
            },
            items: RegisterController(Get.find())
                .list
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
