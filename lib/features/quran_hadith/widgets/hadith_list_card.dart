import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/quran_hadith_controller.dart';
import '../../../../global_widgets/hexagon_painter.dart';

class HadithListCard extends StatelessWidget {
  final HadithBookModel book;
  final int index;

  const HadithListCard({super.key, required this.book, required this.index});

  @override
  Widget build(BuildContext context) {
    // Generate some dynamic colors based on index to match the design
    final List<Color> colors = [
      const Color(0xFF1B6A4C), // Dark green
      const Color(0xFF144B36), // Even darker green
      const Color(0xFF1E3A5F), // Dark blue
      const Color(0xFFA13C4B), // Red/maroon
      const Color(0xFF6B4582), // Purple
    ];
    
    final bool isFilled = index == 1 || index == 2; // Make some filled and some outlined like the design
    final Color color = colors[index % colors.length];

    return Container(
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
                color: color,
                isFilled: isFilled,
              ),
              child: Center(
                child: Icon(
                  Icons.menu_book,
                  size: 20.w,
                  color: isFilled ? AppColors.white : color,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          
          // Book Name & Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.name,
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
                      '${book.hadithCount} Hadiths',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade600,
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
                    SizedBox(width: 4.w),
                    Text(
                      'Authentic',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Arabic Name
          Text(
            book.arabicName,
            style: TextStyle(
              fontSize: 18.sp,
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
    );
  }
}
