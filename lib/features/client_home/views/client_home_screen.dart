import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../view_models/client_home_controller.dart';
import '../widgets/home_banner.dart';
import '../widgets/practitioner_card.dart';
import '../widgets/popular_practitioner_card.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientHomeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Assalamu Alaikum,\nAhmed',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                      height: 1.2,
                    ),
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        AppIcons.notificationIcon,
                        width: 24.w,
                        height: 24.w,
                        colorFilter: const ColorFilter.mode(AppColors.primaryGreen, BlendMode.srcIn),
                      ),
                      Positioned(
                        right: 2.w,
                        top: 2.h,
                        child: Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              
              // Search Bar
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.searchPractitioners),
                child: AbsorbPointer(
                  child: CustomTextField(
                    textEditingController: controller.searchController,
                    hintText: 'Search verified practitioners...',
                    prefixIcon: Icon(Icons.search, color: AppColors.greyShade),
                    fillColor: AppColors.white,
                    fieldBorderColor: Colors.grey.shade300,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              
              // Banner
              const HomeBanner(),
              SizedBox(height: 28.h),
              
              // Recommended For You
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended For You',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              
              SizedBox(
                height: 310.h,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.recommendedPractitioners.length,
                    itemBuilder: (context, index) {
                      final practitioner = controller.recommendedPractitioners[index];
                      return PractitionerCard(
                        practitioner: practitioner,
                        onBookNow: () => controller.onBookNow(practitioner),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              
              // Qur'an and Hadith cards
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.quranHadith, arguments: {'tabIndex': 0}),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColors.primaryGreen, width: 1.5),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.quranIcon,
                              width: 32.w,
                              height: 32.w,
                              colorFilter: const ColorFilter.mode(AppColors.primaryGreen, BlendMode.srcIn),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "Qur'an",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.quranHadith, arguments: {'tabIndex': 1}),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColors.primaryGreen, width: 1.5),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.hadithIcon,
                              width: 32.w,
                              height: 32.w,
                              colorFilter: const ColorFilter.mode(AppColors.primaryGreen, BlendMode.srcIn),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "Hadith",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              
              // Popular Practitioners
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Practitioners',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              
              Obx(
                () => Column(
                  children: controller.popularPractitioners
                      .map((practitioner) => PopularPractitionerCard(
                            practitioner: practitioner,
                            onBookNow: () => controller.onBookNow(practitioner),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
