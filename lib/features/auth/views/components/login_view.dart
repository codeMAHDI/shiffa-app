import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../view_models/auth_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          'Email Address',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black_03,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.loginEmailController,
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
        ),
        SizedBox(height: 16.h),
        Text(
          'Password',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black_03,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.loginPasswordController,
          hintText: 'Enter your password',
          isPassword: true,
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: controller.navigateToForgotPassword,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomButton(
          onTap: controller.login,
          title: 'Login',
          fillColor: AppColors.primaryGreen,
          textColor: AppColors.white,
          borderRadius: 12,
        ),
        SizedBox(height: 24.h),
        Center(
          child: GestureDetector(
            onTap: () {
              // OTP Login logic
            },
            child: Text(
              'Login with phone (OTP)',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Center(
          child: GestureDetector(
            onTap: () => controller.switchTab(1),
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
                children: [
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
