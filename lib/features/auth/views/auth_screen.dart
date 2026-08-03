import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_pill_tab_bar/custom_pill_tab_bar.dart';
import '../view_models/auth_controller.dart';
import 'components/login_view.dart';
import 'components/register_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

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
              SizedBox(height: 16.h),
              
              Obx(() => controller.selectedTabIndex.value == 0 
                ? Column(
                    children: [
                      Text(
                        'Welcome to Shifaa',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Begin your journey with faith and peace.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink()
              ),
              
              SizedBox(height: 24.h),
              
              // Custom Pill Tab Bar (Toggle)
              Obx(() => CustomPillTabBar(
                    tabs: const ['Login', 'Register'],
                    selectedIndex: controller.selectedTabIndex.value,
                    onTabSelected: controller.switchTab,
                  )),
                  
              SizedBox(height: 16.h),
              
              // The active view
              Obx(() => controller.selectedTabIndex.value == 0
                  ? const LoginView()
                  : const RegisterView()),
            ],
          ),
        ),
      ),
    );
  }
}
