import 'package:esp32proje/data/src/colors.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

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
}

Widget _buildBody() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildRegisterForm(),
      )
    ],
  );
}

Widget _buildRegisterForm() {
  return Column(
    children: [
      Material(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(300),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 3, 15, 3),
          child: TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: registermail),
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.005),
      Material(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(300),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 3, 15, 3),
          child: TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: registernick),
          ),
        ),
      )
    ],
  );
}
