import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';

class AuthController extends GetxController {
  // Tab index for CustomPillTabBar (0 = Login, 1 = Register)
  final RxInt selectedTabIndex = 0.obs;

  // Controllers for Login
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // Controllers for Register
  final regNameController = TextEditingController();
  final regEmailPhoneController = TextEditingController();
  final regLocationController = TextEditingController();
  final regPasswordController = TextEditingController();
  final regConfirmPasswordController = TextEditingController();

  // Controllers for Reset Password
  final forgotEmailPhoneController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  void switchTab(int index) {
    selectedTabIndex.value = index;
  }

  void login() {
    print("Email: ${loginEmailController.text}, Password: ${loginPasswordController.text}");
    // After successful login, go to the dashboard based on role
    // Since we don't have role selection persisted globally yet, 
    // we'll assume Client role for now and route to Client Dashboard.
    Get.offAllNamed(AppRoutes.clientDashboard);
  }

  void register() {
    // Implement register logic
    print("Registering ${regNameController.text}");
    Get.offAllNamed(AppRoutes.accountReadyScreen);
  }

  void navigateToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void sendForgotPasswordLink() {
    Get.toNamed(AppRoutes.verifyOtpScreen);
  }

  void verifyOtp() {
    Get.toNamed(AppRoutes.setNewPasswordScreen);
  }

  void updatePassword() {
    // Update password logic, then back to login
    Get.offAllNamed(AppRoutes.authScreen);
    selectedTabIndex.value = 0; // Ensure login is selected
  }
}
