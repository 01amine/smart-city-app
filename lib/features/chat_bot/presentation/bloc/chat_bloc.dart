
import 'package:bsc/features/chat_bot/domain/entities/message.dart';
import 'package:bsc/features/chat_bot/domain/repositories/chat_repo.dart';
import 'package:bsc/features/chat_bot/presentation/bloc/chat_event.dart';
import 'package:bsc/features/chat_bot/presentation/bloc/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;
  final List<Message> _messages = [];

  ChatBloc(this.chatRepository) : super(ChatInitialState()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoadingState());
    try {
      final botMessage = await chatRepository.sendMessage(event.userMessage);
      _messages.add(Message(role: 'user', message: event.userMessage));
      _messages.add(botMessage);
      emit(ChatLoadedState(List.from(_messages)));
    } catch (e) {
      emit(ChatErrorState(e.toString()));
    }
  }
}
