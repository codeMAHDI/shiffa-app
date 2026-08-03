import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../view_models/auth_controller.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              // Logo
              Image.asset(
                AppIcons.shifaaLogo,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.health_and_safety, color: AppColors.splashGold, size: 40),
              ),
              SizedBox(height: 32.h),
              
              Text(
                'SET A NEW PASSWORD',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 32.h),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_03,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              
              CustomTextField(
                textEditingController: controller.newPasswordController,
                hintText: 'Enter your password',
                isPassword: true,
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                fillColor: AppColors.white,
                fieldBorderColor: Colors.grey.shade300,
              ),
              SizedBox(height: 16.h),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm New Password',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_03,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              
              CustomTextField(
                textEditingController: controller.confirmNewPasswordController,
                hintText: 'Enter your password',
                isPassword: true,
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                fillColor: AppColors.white,
                fieldBorderColor: Colors.grey.shade300,
              ),
              SizedBox(height: 32.h),
              
              CustomButton(
                onTap: controller.updatePassword,
                title: 'Update Password',
                fillColor: AppColors.primaryGreen,
                textColor: AppColors.white,
                borderRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
