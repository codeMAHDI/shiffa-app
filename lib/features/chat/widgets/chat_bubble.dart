import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: message.isMe ? AppColors.primaryGreen : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.end, // Time is always at the end in the design
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: message.isMe ? AppColors.white : AppColors.black.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 10.sp,
                color: message.isMe ? AppColors.white.withOpacity(0.8) : AppColors.greyShade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
