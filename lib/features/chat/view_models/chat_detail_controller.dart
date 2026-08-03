import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/message_model.dart';
import '../models/chat_thread_model.dart';

class ChatDetailController extends GetxController {
  final ChatThreadModel chatThread = Get.arguments as ChatThreadModel;
  final TextEditingController messageController = TextEditingController();
  final RxList<MessageModel> messages = <MessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockMessages();
  }

  void _loadMockMessages() {
    // If we want to test empty state, we can leave this empty.
    // For now, let's pre-populate some messages to match Image 2
    messages.value = [
      MessageModel(
        id: '1',
        text: 'Cras eget placerat diam. Aliquam mauris libero,\nsemper vel nisi non, suscipit.',
        time: '09:55 am',
        isMe: true,
      ),
      MessageModel(
        id: '2',
        text: 'Sed ac ante dolor. Mauris nec erat vitae felis\npharetra molestie vitae a nibh.',
        time: '09:57 am',
        isMe: false,
      ),
      MessageModel(
        id: '3',
        text: 'Duis eleifend, quam eu tristique\negestas, justo justo vulputate?',
        time: '09:58 am',
        isMe: true,
      ),
      MessageModel(
        id: '4',
        text: 'Integer mauris nibh, tristique fringilla?',
        time: '10:00 am',
        isMe: false,
      ),
    ];
  }

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(
        MessageModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: messageController.text.trim(),
          time: 'Now',
          isMe: true,
        ),
      );
      messageController.clear();
    }
  }

  void clearChat() {
    messages.clear(); // To test the empty state
  }
}
