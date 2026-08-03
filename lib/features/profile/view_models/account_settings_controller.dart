import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/action_dialog.dart';
import '../../../../core/app_routes/app_routes.dart';

class AccountSettingsController extends GetxController {

  void showDeleteAccountDialog() {
    Get.dialog(
      ActionDialog(
        title: 'Confirm deleting your\naccount?',
        onYes: () {
          Get.back(); // close dialog
          Get.offAllNamed(AppRoutes.authScreen); // simulate account deletion logout
          Get.snackbar('Account Deleted', 'Your account has been deleted.', snackPosition: SnackPosition.BOTTOM);
        },
        onNo: () {
          Get.back(); // close dialog
        },
      ),
    );
  }
}
