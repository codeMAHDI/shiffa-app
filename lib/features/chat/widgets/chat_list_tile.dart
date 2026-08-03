import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/chat_thread_model.dart';

class ChatListTile extends StatelessWidget {
  final ChatThreadModel chatThread;
  final VoidCallback onTap;

  const ChatListTile({
    super.key,
    required this.chatThread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: chatThread.isUnread ? AppColors.primaryGreen : AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: chatThread.isUnread
              ? null
              : Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: 26.r,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: const AssetImage('assets/images/practitioner_image.png'),
                ),
                if (chatThread.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade600,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16.w),
            
            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatThread.userName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: chatThread.isUnread ? AppColors.white : AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chatThread.lastMessage,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: chatThread.isUnread
                          ? AppColors.white.withOpacity(0.9)
                          : AppColors.greyShade,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
            // Time and Checkmark
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chatThread.time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: chatThread.isUnread ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Icon(
                  Icons.done_all,
                  size: 18.w,
                  color: chatThread.isUnread ? AppColors.white : AppColors.greyShade,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
