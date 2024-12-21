// Events
abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String userMessage;

  SendMessageEvent(this.userMessage);
}