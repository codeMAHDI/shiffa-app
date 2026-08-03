import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../view_models/auth_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        
        // Full Name
        Text(
          'Full Name',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.black_03),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.regNameController,
          hintText: 'Enter your full name',
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
          prefixIcon: SizedBox(), // Keep empty or adjust based on CustomTextField behavior if prefix icon is true by default
          isPrefixIcon: false,
        ),
        SizedBox(height: 16.h),
        
        // Email Address
        Text(
          'Email Address',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.black_03),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.regEmailPhoneController,
          hintText: 'Enter your email or phone',
          prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
        ),
        SizedBox(height: 16.h),
        
        // Location
        Text(
          'Location',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.black_03),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.regLocationController,
          hintText: 'Location',
          suffixIcon: Icon(Icons.location_on_outlined, color: Colors.grey),
          isPrefixIcon: false,
          prefixIcon: SizedBox(),
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
        ),
        SizedBox(height: 16.h),
        
        // Password
        Text(
          'Password',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.black_03),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.regPasswordController,
          hintText: 'Enter your password',
          isPassword: true,
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
        ),
        SizedBox(height: 16.h),
        
        // Confirm Password
        Text(
          'Confirm Password',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.black_03),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: controller.regConfirmPasswordController,
          hintText: 'Enter your password',
          isPassword: true,
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
          fillColor: AppColors.white,
          fieldBorderColor: Colors.grey.shade300,
        ),
        SizedBox(height: 24.h),
        
        CustomButton(
          onTap: controller.register,
          title: 'Sign Up',
          fillColor: AppColors.primaryGreen,
          textColor: AppColors.white,
          borderRadius: 12,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
