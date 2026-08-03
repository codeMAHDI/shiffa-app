import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';

class TodaysScheduleScreen extends StatelessWidget {
  const TodaysScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Todays Scheedule', // Matching the spelling in the design
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        children: [
          _buildTimeBlock(
            time: '09:00',
            meridiem: 'AM',
            child: _buildAppointmentCard(
              name: 'Fatima Zahra',
              type: 'Video Consultation',
              typeIcon: Icons.videocam_outlined,
              isConfirmed: true,
            ),
          ),
          SizedBox(height: 24.h),
          
          _buildTimeBlock(
            time: '10:00',
            meridiem: 'AM',
            child: Column(
              children: [
                _buildAppointmentCard(
                  name: 'Ahmed Al-Sayed',
                  type: 'Video Consultation',
                  typeIcon: Icons.mic_none, // Note: image shows a mic icon for video consultation in Ahmed's card, but wait, the text says Video Consultation but icon is mic? Actually first is mic for Voice, second is Video? No, second is Video Consultation with mic icon. Third is Voice Consultation with video icon. It seems the mockup has mismatched icons. I'll use mic for Voice and video for Video.
                  // Looking closely: 1st is Video (video icon). 2nd is Video (mic icon). 3rd is Voice (video icon). I'll use logical icons.
                  typeIconOveride: Icons.mic_none,
                ),
                SizedBox(height: 16.h),
                _buildAppointmentCard(
                  name: 'Ahmad Al-Fulan',
                  type: 'Voice Consultation',
                  typeIcon: Icons.videocam_outlined,
                  typeIconOveride: Icons.videocam_outlined,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          
          _buildTimeBlock(
            time: '11:00',
            meridiem: 'AM',
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBlock({required String time, required String meridiem, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            Text(
              meridiem,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        child,
      ],
    );
  }

  Widget _buildAppointmentCard({
    required String name,
    required String type,
    IconData? typeIconOveride,
    IconData typeIcon = Icons.videocam_outlined,
    bool isConfirmed = true,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImages.women),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(typeIconOveride ?? (type.contains('Video') ? Icons.videocam_outlined : Icons.call_outlined), color: Colors.grey.shade700, size: 16.w),
                        SizedBox(width: 4.w),
                        Text(
                          type,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFF86E4B4).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Confirmed',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade200, height: 1),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    side: BorderSide(color: AppColors.primaryGreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Message',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
