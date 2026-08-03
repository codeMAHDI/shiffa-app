import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/practitioner_dashboard_controller.dart';

class PractitionerHomeScreen extends StatefulWidget {
  const PractitionerHomeScreen({super.key});

  @override
  State<PractitionerHomeScreen> createState() => _PractitionerHomeScreenState();
}

class _PractitionerHomeScreenState extends State<PractitionerHomeScreen> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Good Evening, Mr. Omar 👋',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.notifications_active, color: AppColors.primaryGreen, size: 28.w),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'May your work today be filled with barakah.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 20.h),

              // Available Toggle
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Available',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: isAvailable,
                        onChanged: (val) {
                          setState(() {
                            isAvailable = val;
                          });
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primaryGreen,
                        inactiveTrackColor: Colors.grey.shade300,
                        inactiveThumbColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Summary Cards
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.2,
                children: [
                  _buildSummaryCard(
                    icon: Icons.calendar_today_outlined,
                    title: "Today's Appointments",
                    value: "4",
                    subtitle: "+2 from yesterday",
                    subtitleColor: AppColors.primaryGreen,
                    onTap: () => Get.toNamed(AppRoutes.todaysSchedule),
                  ),
                  _buildSummaryCard(
                    icon: Icons.money_outlined,
                    title: "Earnings",
                    value: "\$10,250",
                    subtitle: "High performance",
                    subtitleColor: AppColors.primaryGreen,
                    onTap: () => Get.find<PractitionerDashboardController>().changeIndex(1),
                  ),
                  _buildSummaryCard(
                    icon: Icons.assignment_outlined,
                    title: "Pending Requests",
                    value: "3",
                    subtitle: "Action required",
                    subtitleColor: Colors.amber.shade700,
                    onTap: () => Get.toNamed(AppRoutes.pendingRequests),
                  ),
                  _buildSummaryCard(
                    icon: Icons.chat_bubble_outline,
                    title: "Unread Messages",
                    value: "8",
                    subtitle: "New unread",
                    subtitleColor: AppColors.primaryGreen,
                    onTap: () => Get.find<PractitionerDashboardController>().changeIndex(2),
                  ),
                ],
              ),
              SizedBox(height: 32.h),

              // Next Session (Labeled as Earnings in mockup typo, using Next Session for clarity)
              Text(
                'Next Session',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 16.h),

              // Big Green Card
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B6A4C), // Dark green background
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'NEXT SESSION',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1B6A4C),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Ahmad Al-Fulan',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Icon(Icons.videocam_outlined, color: AppColors.white, size: 20.w),
                        SizedBox(width: 8.w),
                        Text(
                          'Video Consultation',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: AppColors.white, size: 20.w),
                        SizedBox(width: 8.w),
                        Text(
                          '10:30 AM (In 15 mins)',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.videocam, color: const Color(0xFF1B6A4C)),
                        label: Text(
                          'Join Now',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B6A4C),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color subtitleColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: AppColors.primaryGreen, size: 20.w),
              ),
              Expanded(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: subtitleColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
