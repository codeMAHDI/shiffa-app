import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/booking_history_controller.dart';
import '../widgets/booking_history_card.dart';
import '../../client_dashboard/view_models/client_dashboard_controller.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingHistoryController());
    final dashboardController = Get.find<ClientDashboardController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.black),
            onPressed: () => dashboardController.changeIndex(0), // Navigates back to Home Tab
          ),
          title: Text(
            'Booking History',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TabBar(
                indicatorColor: AppColors.primaryGreen,
                indicatorWeight: 3,
                labelColor: AppColors.primaryGreen,
                unselectedLabelColor: Colors.grey.shade600,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                dividerColor: Colors.grey.shade300,
                tabs: const [
                  Tab(text: 'Active Bookings'),
                  Tab(text: 'Past Bookings'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Active Bookings Tab
            Obx(
              () => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                itemCount: controller.activeBookings.length,
                itemBuilder: (context, index) {
                  return BookingHistoryCard(booking: controller.activeBookings[index]);
                },
              ),
            ),
            // Past Bookings Tab
            Obx(
              () => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                itemCount: controller.pastBookings.length,
                itemBuilder: (context, index) {
                  return BookingHistoryCard(booking: controller.pastBookings[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
