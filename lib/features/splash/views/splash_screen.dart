import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../view_models/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Container
                Container(
                  width: 200.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: AppColors.splashBg,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppIcons.logo,
                      width: 150.w,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.health_and_safety, color: AppColors.splashGold, size: 100);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'H E A L I N G   •   T R U S T   •   P E A C E',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.splashGold,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  width: 100.w,
                  child: const LinearProgressIndicator(
                    color: AppColors.splashGold,
                    backgroundColor: Colors.white24,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'PREPARING YOUR SANCTUARY',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
