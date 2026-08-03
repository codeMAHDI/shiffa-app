import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/booking_summary_controller.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingSummaryController());

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
          'Booking',
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
                    // Practitioner Info Card
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
                          Row(
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
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
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                        height: 1.2,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      children: [
                                        Icon(Icons.verified_outlined, color: Colors.grey.shade600, size: 14.w),
                                        SizedBox(width: 4.w),
                                        Text(
                                          'Specialist Practitioner',
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
                          SizedBox(height: 16.h),
                          Divider(color: Colors.grey.shade200),
                          SizedBox(height: 16.h),
                          
                          // Details
                          _buildDetailRow(Icons.videocam_outlined, 'Consultation Type', 'Video Consultation'),
                          SizedBox(height: 12.h),
                          _buildDetailRow(Icons.calendar_today_outlined, 'Date', 'Sunday, ${controller.selectedDate} Oct 2026'),
                          SizedBox(height: 12.h),
                          _buildDetailRow(Icons.access_time, 'Time', controller.selectedTime),
                          SizedBox(height: 12.h),
                          _buildDetailRow(Icons.timelapse, 'Duration', '60 Mins'),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Price Breakdown
                    Text(
                      'Price Breakdown',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Consultation Fee', style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700)),
                              Text('\$${controller.practitioner.pricePerSession.toStringAsFixed(2)}', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.black)),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Platform Fee', style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700)),
                              Text('\$5.00', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.black)),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount', style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700)),
                              Text('-\$0.00', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Divider(color: Colors.grey.shade200),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.black)),
                              Text('\$${(controller.practitioner.pricePerSession + 5).toStringAsFixed(2)}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Promo Code
                    Text(
                      'Promo Code',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter code',
                                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400, // Should turn green when active ideally
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Consultation Notes
                    Text(
                      'Consultation Notes (Optional)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 100.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Please provide any brief context for your\nconsultation...',
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Checkbox
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () => controller.acceptedTerms.toggle(),
                            child: Container(
                              width: 20.w,
                              height: 20.w,
                              margin: EdgeInsets.only(top: 2.h),
                              decoration: BoxDecoration(
                                color: controller.acceptedTerms.value ? AppColors.primaryGreen : AppColors.white,
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                  color: controller.acceptedTerms.value ? AppColors.primaryGreen : Colors.grey.shade300,
                                ),
                              ),
                              child: controller.acceptedTerms.value
                                  ? Icon(Icons.check, size: 14.w, color: AppColors.white)
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'booking policy',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'terms of\nservice.',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            
            // Proceed Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.proceedToPayment,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Proceed to Secure Payment',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock_outline, size: 12.w, color: Colors.grey.shade600),
                        SizedBox(width: 6.w),
                        Text(
                          'Encrypted and secure transaction',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
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

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.primaryGreen, size: 18.w),
            SizedBox(width: 8.w),
            Text(title, style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600)),
          ],
        ),
        Text(value, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColors.black)),
      ],
    );
  }
}
