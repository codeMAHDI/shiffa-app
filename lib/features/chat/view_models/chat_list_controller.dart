import 'package:get/get.dart';
import '../models/chat_thread_model.dart';

class ChatListController extends GetxController {
  final RxList<ChatThreadModel> chatThreads = <ChatThreadModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    chatThreads.value = [
      ChatThreadModel(
        id: '1',
        userName: 'John Smith',
        userRole: 'House Keeper',
        avatarUrl: 'assets/images/practitioner_image.png',
        lastMessage: 'Hello, are you here?',
        time: '1:20 PM',
        isUnread: true,
        isOnline: true,
      ),
      ChatThreadModel(
        id: '2',
        userName: 'John Smith',
        userRole: 'House Keeper',
        avatarUrl: 'assets/images/practitioner_image.png',
        lastMessage: 'Hello, are you here?',
        time: '1:20 PM',
        isUnread: true,
        isOnline: true,
      ),
      ChatThreadModel(
        id: '3',
        userName: 'John Smith',
        userRole: 'House Keeper',
        avatarUrl: 'assets/images/practitioner_image.png',
        lastMessage: 'Hello, are you here?',
        time: '1:20 PM',
        isUnread: false,
        isOnline: true,
      ),
      ChatThreadModel(
        id: '4',
        userName: 'John Smith',
        userRole: 'House Keeper',
        avatarUrl: 'assets/images/practitioner_image.png',
        lastMessage: 'Hello, are you here?',
        time: '1:20 PM',
        isUnread: false,
        isOnline: true,
      ),
      ChatThreadModel(
        id: '5',
        userName: 'John Smith',
        userRole: 'House Keeper',
        avatarUrl: 'assets/images/practitioner_image.png',
        lastMessage: 'Hello, are you here?',
        time: '1:20 PM',
        isUnread: false,
        isOnline: true,
      ),
      ChatThreadModel(
        id: '6',
        userName: 'John Smith',
        userRole: 'House Keeper',
        avatarUrl: 'assets/images/practitioner_image.png',
        lastMessage: 'Hello, are you here?',
        time: '1:20 PM',
        isUnread: false,
        isOnline: true,
      ),
    ];
  }
}
