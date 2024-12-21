class Message {
  final String role; // 'user' or 'bot'
  final String message;

  const Message({required this.role, required this.message});
}
