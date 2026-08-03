import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/change_password_controller.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());

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
          'Change Password',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFieldLabel('Current Password'),
              Obx(() => CustomTextField(
                textEditingController: controller.currentPasswordController,
                hintText: '********',
                isPassword: controller.obscureCurrent.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscureCurrent.value ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: controller.toggleCurrent,
                ),
                fillColor: AppColors.white,
                fieldBorderColor: Colors.grey.shade300,
              )),
              SizedBox(height: 24.h),

              _buildFieldLabel('New Password'),
              Obx(() => CustomTextField(
                textEditingController: controller.newPasswordController,
                hintText: '********',
                isPassword: controller.obscureNew.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscureNew.value ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: controller.toggleNew,
                ),
                fillColor: AppColors.white,
                fieldBorderColor: Colors.grey.shade300,
              )),
              SizedBox(height: 24.h),

              _buildFieldLabel('Confirm Password'),
              Obx(() => CustomTextField(
                textEditingController: controller.confirmPasswordController,
                hintText: '********',
                isPassword: controller.obscureConfirm.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscureConfirm.value ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: controller.toggleConfirm,
                ),
                fillColor: AppColors.white,
                fieldBorderColor: Colors.grey.shade300,
              )),
              
              const Spacer(),
              
              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.updatePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Update Password',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
    );
  }
}
