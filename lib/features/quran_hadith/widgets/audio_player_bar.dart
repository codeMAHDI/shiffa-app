import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class AudioPlayerBar extends StatelessWidget {
  const AudioPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: const Color(0xFF78B39B), // Custom light greenish background from design
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Previous
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18.w),
          ),
          
          // Play Button
          Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.play_arrow, color: AppColors.white, size: 28.w),
          ),
          
          // Text Size
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.text_fields, color: AppColors.white, size: 22.w),
          ),
          
          // Bookmark
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border, color: AppColors.white, size: 22.w),
          ),
          
          // Next
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 18.w),
          ),
        ],
      ),
    );
  }
}
