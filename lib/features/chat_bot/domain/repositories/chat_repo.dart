

import 'package:bsc/features/chat_bot/data/sources/remote_source.dart';
import 'package:bsc/features/chat_bot/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Message> sendMessage(String userMessage);
}

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Message> sendMessage(String userMessage) async {
    return await remoteDataSource.sendMessage(userMessage);
  }
}
