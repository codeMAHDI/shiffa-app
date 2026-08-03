import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/search_controller.dart' as search_module;
import '../widgets/search_practitioner_card.dart';
import '../widgets/specialty_tag.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(search_module.SearchController());

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
          'Search Practitioners',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input and Filter Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Icon(Icons.search, color: Colors.grey.shade500, size: 20.w),
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.searchInputController,
                              decoration: InputDecoration(
                                hintText: 'Search practitioner by\nname or specialty ...',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 14.sp,
                                  height: 1.2,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                              ),
                              maxLines: 2,
                              minLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.advancedFilters),
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.tune, // Filter icon
                          color: AppColors.white,
                          size: 24.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Popular Specialties Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Popular Specialties',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            
            // Popular Specialties Tags
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(
                () => Row(
                  children: controller.popularSpecialties.map((specialty) {
                    final isSelected = controller.selectedSpecialty.value == specialty;
                    return SpecialtyTag(
                      text: specialty,
                      isSelected: isSelected,
                      onTap: () => controller.selectSpecialty(specialty),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            
            // Results Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Showing 124 Practitioners',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Sort by: ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      Text(
                        'Top Rated ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryGreen,
                        size: 16.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            
            // List of Practitioners
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    return SearchPractitionerCard(
                      practitioner: controller.searchResults[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
