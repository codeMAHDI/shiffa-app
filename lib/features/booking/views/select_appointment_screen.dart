import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/select_appointment_controller.dart';

class SelectAppointmentScreen extends StatelessWidget {
  const SelectAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectAppointmentController());

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
          'Select Appointment',
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
                    // Practitioner Header
                    Container(
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
                      child: Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(controller.practitioner.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.practitioner.name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Icon(Icons.verified_outlined, color: AppColors.primaryGreen, size: 14.w),
                                    SizedBox(width: 4.w),
                                    Text(
                                      controller.practitioner.tags.isNotEmpty
                                          ? controller.practitioner.tags[0]
                                          : 'Specialist',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Calendar View
                    Container(
                      padding: EdgeInsets.all(20.w),
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
                          // Month Selector
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.chevron_left, color: Colors.grey.shade700),
                              Text(
                                'October 2026',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              Icon(Icons.chevron_right, color: Colors.grey.shade700),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          
                          // Days of week
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                                .map((day) => SizedBox(
                                      width: 32.w,
                                      child: Center(
                                        child: Text(
                                          day,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 16.h),
                          
                          // Dates Grid
                          _buildCalendarGrid(controller),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Time Slots
                    _buildTimeSection('Morning', Icons.wb_sunny_outlined, ['09:00 AM', '10:00 AM', '11:00 AM'], controller),
                    SizedBox(height: 24.h),
                    _buildTimeSection('Afternoon', Icons.wb_sunny_outlined, ['02:00 PM', '03:00 PM', '04:00 PM'], controller),
                    SizedBox(height: 24.h),
                    _buildTimeSection('Evening', Icons.nightlight_round_outlined, ['07:00 PM', '08:00 PM'], controller),
                    SizedBox(height: 32.h),

                    // Appointment Summary
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColors.primaryGreen.withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'APPOINTMENT SUMMARY',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: AppColors.primaryGreen,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Type', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                                  SizedBox(height: 4.h),
                                  Text('Video\nConsultation', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.black)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Fee', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '\$${controller.practitioner.pricePerSession.toInt()}',
                                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                                  SizedBox(height: 4.h),
                                  Obx(() => Text(
                                        'Sunday, ${controller.selectedDate.value} Oct\n2026',
                                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.black),
                                      )),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Time', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                                  SizedBox(height: 4.h),
                                  Obx(() => Text(
                                        controller.selectedTime.value,
                                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.black),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
            
            // Continue to Payment Button
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
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.continueToPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Continue to Payment',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(SelectAppointmentController controller) {
    // Mockup calendar layout specifically matching the image for October 2026
    final List<List<int?>> weeks = [
      [null, null, null, null, null, null, 1], // The previous dates are faded 25, 26... but we will just pass null or render greyed out
      [2, 3, 4, 5, 6, 7, 8],
      [9, 10, 11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20, 21, null],
    ];
    
    // Dates with dots (available slots)
    final availableDates = [16, 17, 20];

    return Column(
      children: weeks.map((week) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: week.map((date) {
              if (date == null) {
                // Return empty placeholder for faded dates (or we could hardcode the faded ones, let's keep it simple)
                return SizedBox(width: 36.w, height: 36.w);
              }
              return Obx(() {
                final isSelected = controller.selectedDate.value == date;
                final isAvailable = availableDates.contains(date);
                
                return GestureDetector(
                  onTap: () => controller.selectDate(date),
                  child: SizedBox(
                    width: 36.w,
                    child: Column(
                      children: [
                        Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              date.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.white
                                    : (date == 18 || date == 19) ? Colors.grey.shade400 : AppColors.black, // Just grey out 18,19 to match image roughly
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        if (isAvailable)
                          Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              shape: BoxShape.circle,
                            ),
                          )
                        else
                          SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeSection(String title, IconData icon, List<String> times, SelectAppointmentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.primaryGreen, size: 20.w),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(
          () => Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: times.map((time) {
              final isSelected = controller.selectedTime.value == time;
              return GestureDetector(
                onTap: () => controller.selectTime(time),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryGreen : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? AppColors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
