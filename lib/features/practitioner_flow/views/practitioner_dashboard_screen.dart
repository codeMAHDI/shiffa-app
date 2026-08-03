import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../view_models/practitioner_dashboard_controller.dart';
import 'practitioner_home_screen.dart';
import 'earning_overview_screen.dart';
import '../../chat/views/chat_list_screen.dart';
import '../../profile/views/profile_screen.dart';

class PractitionerDashboardScreen extends StatelessWidget {
  const PractitionerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PractitionerDashboardController());

    final List<Widget> screens = [
      const PractitionerHomeScreen(),
      const EarningOverviewScreen(),
      const ChatListScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeIndex,
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryGreen,
            unselectedItemColor: AppColors.greyShade,
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    AppIcons.homeIcon,
                    colorFilter: ColorFilter.mode(
                      controller.selectedIndex.value == 0
                          ? AppColors.primaryGreen
                          : AppColors.greyShade,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    AppIcons.earningIcon,
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      controller.selectedIndex.value == 1
                          ? AppColors.primaryGreen
                          : AppColors.greyShade,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Earning',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    AppIcons.chatIcon,
                    colorFilter: ColorFilter.mode(
                      controller.selectedIndex.value == 2
                          ? AppColors.primaryGreen
                          : AppColors.greyShade,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    AppIcons.profileIcon,
                    colorFilter: ColorFilter.mode(
                      controller.selectedIndex.value == 3
                          ? AppColors.primaryGreen
                          : AppColors.greyShade,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
