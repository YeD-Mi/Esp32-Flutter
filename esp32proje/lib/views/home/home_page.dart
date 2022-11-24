import 'package:esp32proje/views/home/home_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});
  static const String routeName = '/views/home/home_page';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('HomePage')),
    );
  }
}
