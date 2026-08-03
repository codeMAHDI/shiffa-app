import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/action_dialog.dart';
import '../../../../core/app_routes/app_routes.dart';

class ProfileController extends GetxController {
  
  void showLogoutDialog() {
    Get.dialog(
      ActionDialog(
        title: 'Do you want to Log out?',
        onYes: () {
          Get.back(); // close dialog
          Get.offAllNamed(AppRoutes.authScreen); // go to login
        },
        onNo: () {
          Get.back(); // close dialog
        },
      ),
    );
  }
}
