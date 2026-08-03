class ChatThreadModel {
  final String id;
  final String userName;
  final String userRole;
  final String avatarUrl;
  final String lastMessage;
  final String time;
  final bool isUnread;
  final bool isOnline;

  ChatThreadModel({
    required this.id,
    required this.userName,
    required this.userRole,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,
    this.isUnread = false,
    this.isOnline = false,
  });
}
