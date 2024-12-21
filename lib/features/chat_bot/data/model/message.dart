

import 'package:bsc/features/chat_bot/domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel({required String role, required String message})
      : super(role: role, message: message);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      role: json['role'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'message': message,
    };
  }
}
