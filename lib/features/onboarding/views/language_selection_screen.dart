import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../view_models/onboarding_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: AppColors.white_50,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              // Logo
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.splashBg,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Image.asset(
                    AppIcons.logo,
                    width: 60.w,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.health_and_safety, color: AppColors.splashGold, size: 40),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Titles
              Text(
                'Welcome to Shifaa',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'شفاء',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Choose your preferred language.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyShade,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40.h),
              
              // Language Options
              Obx(() => _buildLanguageOption('English', controller)),
              SizedBox(height: 16.h),
              Obx(() => _buildLanguageOption('العربية', controller, isArabic: true)),
              SizedBox(height: 16.h),
              Obx(() => _buildLanguageOption('Soomaali', controller)),
              
              const Spacer(),
              
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: controller.continueFromLanguage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              
              // Footer text
              Text(
                'Language can be changed later in Settings.',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.greyShade,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language, OnboardingController controller, {bool isArabic = false}) {
    final isSelected = controller.selectedLanguage.value == language;
    return GestureDetector(
      onTap: () => controller.selectLanguage(language),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryGreen : Colors.grey.shade400,
                  width: isSelected ? 0 : 2,
                ),
                color: isSelected ? AppColors.primaryGreen : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16.sp, color: AppColors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
