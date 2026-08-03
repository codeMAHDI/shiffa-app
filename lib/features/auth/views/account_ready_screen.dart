import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../core/app_routes/app_routes.dart';

class AccountReadyScreen extends StatefulWidget {
  const AccountReadyScreen({super.key});

  @override
  State<AccountReadyScreen> createState() => _AccountReadyScreenState();
}

class _AccountReadyScreenState extends State<AccountReadyScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Get.offAllNamed(AppRoutes.authScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            // Big green circle with checkmark
            Container(
              width: 100.w,
              height: 100.w,
              decoration: const BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 60.w,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            // Text "Your account is ready"
            Text(
              'Your account is ready',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
