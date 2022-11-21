import 'package:esp32proje/data/src/images.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:esp32proje/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/views/login/login_page';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return Stack(
    children: [_buildImage(context), _buildLoginForm(context)],
  );
}

Widget _buildImage(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height,
    decoration: BoxDecoration(
      color: Colors.blueGrey.shade500,
      image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage(electric),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildLoginForm(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(
        bottom: size.height * 0.1,
        left: size.width * 0.1,
        right: size.width * 0.1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 10,
                  )
                ],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: 'Kullanıcı Adı'),
            )),
        SizedBox(height: size.height * 0.005),
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 10,
                  )
                ],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: 'Şifre'),
            )),
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {}, child: Text(loginbutton)),
            ElevatedButton(onPressed: () {}, child: Text(signupbutton)),
          ],
        ),
      ],
    ),
  );
}
