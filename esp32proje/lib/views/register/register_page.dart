import 'package:esp32proje/views/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RegisterPage extends GetWidget<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);
  static const String routeName = '/views/register/register_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(child: Text('Register')),
      ),
    );
  }
}
