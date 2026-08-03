import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/practitioner_profile_controller.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';

class PractitionerProfileSetupScreen extends StatelessWidget {
  const PractitionerProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PractitionerProfileController());

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
          'Build your profile',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [
            Text(
              'Help us understand your expertise to provide\nthe best care.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
            SizedBox(height: 32.h),

            // Profile Photo Upload
            Center(
              child: Stack(
                children: [
                  DottedBorder(
                    options: CircularDottedBorderOptions(
                      color: AppColors.primaryGreen,
                      strokeWidth: 2,
                      dashPattern: const <double>[6, 4],
                      padding: const EdgeInsets.all(4),
                    ),
                    child: Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined, color: AppColors.primaryGreen, size: 28.w),
                          SizedBox(height: 4.h),
                          Text(
                            'UPLOAD\nPHOTO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.greyShade,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: Icon(Icons.edit, color: AppColors.white, size: 14.w),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Identification & Experience
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.badge_outlined, color: AppColors.primaryGreen, size: 20.w),
                      SizedBox(width: 8.w),
                      Text(
                        'Identification & Experience',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  
                  Text(
                    'National ID (NID) Upload',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      color: Colors.grey.shade400,
                      strokeWidth: 1,
                      dashPattern: const <double>[6, 4],
                      radius: Radius.circular(12.r),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.cloud_upload_outlined, color: AppColors.primaryGreen, size: 32.w),
                          SizedBox(height: 8.h),
                          Text(
                            'Click to upload or drag NID copy',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'PDF, PNG OR JPG (MAX 5MB)',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  
                  Text(
                    'Years of Experience',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hintText: 'Experience',
                    fillColor: Colors.grey.shade100,
                    fieldBorderColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Select Your Skills
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, color: AppColors.primaryGreen, size: 20.w),
                      SizedBox(width: 8.w),
                      Text(
                        'Select Your Skills',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Choose types of consultations you provide.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => Wrap(
                      spacing: 8.w,
                      runSpacing: 12.h,
                      children: controller.availableSkills.map((skill) {
                        bool isSelected = controller.selectedSkills.contains(skill);
                        return GestureDetector(
                          onTap: () => controller.toggleSkill(skill),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primaryGreen : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isSelected) ...[
                                  Icon(Icons.check_circle, color: AppColors.white, size: 14.w),
                                  SizedBox(width: 6.w),
                                ],
                                Text(
                                  skill,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? AppColors.white : AppColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Languages Spoken
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Languages Spoken',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Wrap(
                  spacing: 12.w,
                  children: [
                    ...controller.selectedLanguages.map((lang) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          lang,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      );
                    }).toList(),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryGreen, width: 1),
                      ),
                      child: Icon(Icons.add, color: AppColors.primaryGreen, size: 20.w),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Consultation Fees
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Consultation Fees',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            
            // Video Session
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.videocam_outlined, color: AppColors.primaryGreen, size: 24.w),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Video Session',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          'Per 30-minute\nblock',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        '50 \$',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            
            // Voice Session
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.call_outlined, color: AppColors.primaryGreen, size: 24.w),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Voice Session',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          'Per 30-minute\nblock',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        '30 \$',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Checkbox(
                      value: controller.isTermsAccepted.value,
                      onChanged: controller.toggleTerms,
                      activeColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'I confirm that the information provided is accurate. I understand that my profile will be visible to potential clients after verification of the submitted documents.',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Alert Info
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryGreen, width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: AppColors.primaryGreen, size: 20.w),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'Your service is under review and will be verified within 72 hours. You\'ll receive a notification once verification is complete.',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Complete Setup Button
            CustomButton(
              title: 'Complete Setup',
              fillColor: AppColors.primaryGreen,
              onTap: () {
                Get.toNamed(AppRoutes.practitionerDashboard);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
