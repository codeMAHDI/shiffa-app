import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/profile_controller.dart';
import '../widgets/profile_menu_item.dart';
import '../../client_dashboard/view_models/client_dashboard_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            if (Get.isRegistered<ClientDashboardController>()) {
              Get.find<ClientDashboardController>().changeIndex(0);
            } else {
              Get.back();
            }
          },
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: const AssetImage('assets/images/practitioner_image.png'),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    'John smith',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              
              Text(
                'Profile information',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16.h),
              
              // Menu Items
              ProfileMenuItem(
                icon: Icons.person,
                text: 'Edit Profile',
                onTap: () => Get.toNamed(AppRoutes.editProfile),
              ),
              ProfileMenuItem(
                icon: Icons.settings,
                text: 'Account Settings',
                onTap: () => Get.toNamed(AppRoutes.accountSettings),
              ),
              ProfileMenuItem(
                icon: Icons.logout,
                text: 'Logout',
                isLogout: true,
                onTap: controller.showLogoutDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
