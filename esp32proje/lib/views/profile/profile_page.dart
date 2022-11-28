import 'package:esp32proje/views/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});
  static const String routeName = '/views/profile/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Sayfasi")),
      body: Container(child: Text("Profile")),
    );
  }
}
