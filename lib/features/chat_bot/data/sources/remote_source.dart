import 'dart:convert';

import 'package:bsc/features/chat_bot/data/model/message.dart';
import 'package:bsc/shared/utils/dio_client.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:dio/src/response.dart';

abstract class ChatRemoteDataSource {
  Future<MessageModel> sendMessage(String userMessage);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  ChatRemoteDataSourceImpl();

  @override
  Future<MessageModel> sendMessage(String userMessage) async {
    final response = await sl<DioClient>().post(
      '/api/chat',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': userMessage}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return MessageModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch bot response');
    }
  }
}

extension on Response {
  String get body => '';
}
