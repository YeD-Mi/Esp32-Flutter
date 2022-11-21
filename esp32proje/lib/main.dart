import 'package:esp32proje/data/get_controllers.dart';
import 'package:esp32proje/data/routing/get_pages.dart';
import 'package:esp32proje/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> main() async {
    await getControllers();
  }

  @override
  Widget build(BuildContext context) {
    main();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home: const LoginPage(),
    );
  }
}
