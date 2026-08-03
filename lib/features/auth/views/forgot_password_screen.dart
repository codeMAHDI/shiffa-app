import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../view_models/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                'FORGOT PASSWORD',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16.h),
              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Enter your registered email or phone number and we'll send you a link to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyShade,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address /Phone Number',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_03,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              
              CustomTextField(
                textEditingController: controller.forgotEmailPhoneController,
                hintText: 'Enter your email or phone',
                prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                fillColor: AppColors.white,
                fieldBorderColor: Colors.grey.shade300,
              ),
              SizedBox(height: 32.h),
              
              CustomButton(
                onTap: controller.sendForgotPasswordLink,
                title: 'Send',
                fillColor: AppColors.primaryGreen,
                textColor: AppColors.white,
                borderRadius: 12,
              ),
              SizedBox(height: 24.h),
              
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  'Back to Log in',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
