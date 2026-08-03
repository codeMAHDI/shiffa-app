import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class SettingsMenuItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isDestructive;

  const SettingsMenuItem({
    super.key,
    required this.text,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        color: Colors.transparent, // to make the whole row clickable
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: isDestructive ? AppColors.orange : AppColors.black,
              ),
            ),
            if (!isDestructive)
              Icon(
                Icons.arrow_forward_ios,
                size: 16.w,
                color: AppColors.black,
              ),
          ],
        ),
      ),
    );
  }
}
