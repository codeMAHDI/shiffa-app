import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/account_settings_controller.dart';
import '../widgets/settings_menu_item.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountSettingsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Account Settings',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            children: [
              SettingsMenuItem(
                text: 'Change Password',
                onTap: () => Get.toNamed(AppRoutes.changePassword),
              ),
              Divider(color: Colors.grey.shade200, height: 1),
              SettingsMenuItem(
                text: 'Terms of services',
                onTap: () => Get.toNamed(AppRoutes.termsAndConditions),
              ),
              Divider(color: Colors.grey.shade200, height: 1),
              SettingsMenuItem(
                text: 'Privacy Policy',
                onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
              ),
              Divider(color: Colors.grey.shade200, height: 1),
              SettingsMenuItem(
                text: 'About us',
                onTap: () => Get.toNamed(AppRoutes.aboutUs),
              ),
              Divider(color: Colors.grey.shade200, height: 1),
              SizedBox(height: 16.h),
              SettingsMenuItem(
                text: 'Delete Account',
                isDestructive: true,
                onTap: controller.showDeleteAccountDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
