import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/chat_list_controller.dart';
import '../widgets/chat_list_tile.dart';
import '../../client_dashboard/view_models/client_dashboard_controller.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We instantiate or find the controller here
    final controller = Get.put(ChatListController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            // Navigate back to Home tab
            if (Get.isRegistered<ClientDashboardController>()) {
              Get.find<ClientDashboardController>().changeIndex(0);
            } else {
              Get.back();
            }
          },
        ),
        title: Text(
          'Messages',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            itemCount: controller.chatThreads.length,
            itemBuilder: (context, index) {
              final chatThread = controller.chatThreads[index];
              return ChatListTile(
                chatThread: chatThread,
                onTap: () {
                  Get.toNamed(AppRoutes.chatDetail, arguments: chatThread);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
