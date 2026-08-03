import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_pin_code/custom_pin_code.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/auth_controller.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
                'VERIFY OTP',
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
                  "Enter the 4-digit code sent to your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyShade,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              
              CustomPinCode(
                controller: controller.otpController,
                length: 4,
                activeColor: AppColors.primaryGreen,
              ),
              SizedBox(height: 32.h),
              
              CustomButton(
                onTap: controller.verifyOtp,
                title: 'Verify',
                fillColor: AppColors.primaryGreen,
                textColor: AppColors.white,
                borderRadius: 12,
              ),
              SizedBox(height: 24.h),
              
              GestureDetector(
                onTap: () {
                  // If backing out goes to Login or Forgot Password
                  Get.until((route) => Get.currentRoute == AppRoutes.authScreen);
                },
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
