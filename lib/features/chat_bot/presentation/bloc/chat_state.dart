import 'package:bsc/features/chat_bot/domain/entities/message.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<Message> messages;

  ChatLoadedState(this.messages);
}

class ChatSuccessState extends ChatState{
  final List<Message> messages;

  ChatSuccessState({required this.messages});
}

class ChatErrorState extends ChatState {
  final String message;

  ChatErrorState(this.message);

  String get error => 'error';
}
