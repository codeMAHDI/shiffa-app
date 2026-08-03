import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/advanced_filters_controller.dart';

class AdvancedFiltersScreen extends StatelessWidget {
  const AdvancedFiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdvancedFiltersController());

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
          'Advanced Filters',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Language
                    _buildSectionTitle('Language'),
                    SizedBox(height: 12.h),
                    Obx(
                      () => Column(
                        children: controller.languages.map((lang) {
                          final isSelected = controller.selectedLanguage.value == lang;
                          return GestureDetector(
                            onTap: () => controller.selectedLanguage.value = lang,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 12.h),
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primaryGreen.withOpacity(0.05) : AppColors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: isSelected ? AppColors.primaryGreen : Colors.grey.shade300,
                                ),
                              ),
                              child: Text(
                                lang,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Specialties
                    _buildSectionTitle('Specialties'),
                    SizedBox(height: 12.h),
                    Obx(
                      () => Wrap(
                        spacing: 10.w,
                        runSpacing: 12.h,
                        children: controller.specialties.map((spec) {
                          final isSelected = controller.selectedSpecialty.value == spec;
                          return GestureDetector(
                            onTap: () => controller.selectedSpecialty.value = spec,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primaryGreen : AppColors.white,
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(
                                  color: isSelected ? AppColors.primaryGreen : Colors.grey.shade300,
                                ),
                              ),
                              child: Text(
                                spec,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: isSelected ? AppColors.white : AppColors.black,
                                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Availability
                    _buildSectionTitle('Availability'),
                    SizedBox(height: 12.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => Row(
                          children: controller.availabilityOptions.map((avail) {
                            final isSelected = controller.selectedAvailability.value == avail;
                            return GestureDetector(
                              onTap: () => controller.selectedAvailability.value = avail,
                              child: Container(
                                margin: EdgeInsets.only(right: 12.w),
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primaryGreen.withOpacity(0.05) : AppColors.white,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: isSelected ? AppColors.primaryGreen : Colors.grey.shade300,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 16.w,
                                      color: isSelected ? AppColors.primaryGreen : Colors.grey.shade700,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      avail,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: isSelected ? AppColors.primaryGreen : AppColors.black,
                                        fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Price Range
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle('Price Range'),
                        Text(
                          '\$20 - \$150+',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: AppColors.primaryGreen,
                                inactiveTrackColor: Colors.grey.shade200,
                                thumbColor: AppColors.primaryGreen,
                                trackHeight: 4.h,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                                overlayShape: SliderComponentShape.noOverlay,
                              ),
                              child: Slider(
                                value: controller.priceRange.value,
                                min: 0,
                                max: 200,
                                onChanged: (val) => controller.priceRange.value = val,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$0', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                              Text('\$200+', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Verified Practitioners Only
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.verified,
                              color: AppColors.primaryGreen,
                              size: 24.w,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verified Practitioners Only',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Show only background-checked\nproviders',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => Switch(
                              value: controller.verifiedOnly.value,
                              onChanged: (val) => controller.verifiedOnly.value = val,
                              activeColor: AppColors.white,
                              activeTrackColor: AppColors.primaryGreen,
                              inactiveThumbColor: Colors.grey.shade400,
                              inactiveTrackColor: Colors.grey.shade200,
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

            // Bottom Buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: controller.clearFilters,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.primaryGreen, width: 1.5),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Clear Filters',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: controller.applyFilters,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Apply Filters',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.tune, color: AppColors.white, size: 20.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryGreen,
      ),
    );
  }
}
