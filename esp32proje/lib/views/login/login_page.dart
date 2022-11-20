import 'package:esp32proje/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/views/login/login_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Material App Bar')),
      ),
      body: Center(
        child: Container(child: Text('Login')),
      ),
    );
  }
}
