import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/quran_hadith_controller.dart';
import '../../../../global_widgets/hexagon_painter.dart';

class SurahListCard extends StatelessWidget {
  final SurahModel surah;

  const SurahListCard({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    bool isMakki = surah.revelationType == 'MAKKI';
    Color iconColor = isMakki ? AppColors.primaryGreen : AppColors.primaryGreen;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.surahDetail, arguments: surah);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryGreen, width: 1),
        ),
        child: Row(
          children: [
            // Hexagon Icon
            SizedBox(
              width: 44.w,
              height: 44.w,
              child: CustomPaint(
                painter: HexagonPainter(
                  color: iconColor,
                  isFilled: !isMakki,
                ),
                child: Center(
                  child: Text(
                    surah.number.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: isMakki ? AppColors.black : AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            
            // English Name & Revelation Type
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        surah.revelationType,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Arabic Name
            Text(
              surah.arabicName,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            ),
            SizedBox(width: 12.w),
            
            // Arrow Icon
            Icon(
              Icons.chevron_right,
              color: AppColors.black,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
