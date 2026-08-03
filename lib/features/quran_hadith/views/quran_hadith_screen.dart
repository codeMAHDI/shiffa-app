import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/quran_hadith_controller.dart';
import '../widgets/surah_list_card.dart';
import '../widgets/hadith_list_card.dart';

class QuranHadithScreen extends StatelessWidget {
  const QuranHadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuranHadithController());

    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      if (args['tabIndex'] != null) {
        controller.changeTab(args['tabIndex']);
      }
    }

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
          'Al-Qur\'an al Kareem',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Text(
              'Al-Qur\'an al-Kareem',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
          
          // Custom Tab Toggle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.selectedTabIndex.value == 0
                                ? AppColors.primaryGreen
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Center(
                            child: Text(
                              'Qur\'an',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: controller.selectedTabIndex.value == 0
                                    ? AppColors.white
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.selectedTabIndex.value == 1
                                ? AppColors.primaryGreen
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Center(
                            child: Text(
                              'Hadith',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: controller.selectedTabIndex.value == 1
                                    ? AppColors.white
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          
          // Content
          Expanded(
            child: Obx(() {
              if (controller.selectedTabIndex.value == 0) {
                // Quran Tab
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  itemCount: controller.surahs.length,
                  itemBuilder: (context, index) {
                    return SurahListCard(surah: controller.surahs[index]);
                  },
                );
              } else {
                // Hadith Tab
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  itemCount: controller.hadithBooks.length,
                  itemBuilder: (context, index) {
                    return HadithListCard(book: controller.hadithBooks[index], index: index);
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
