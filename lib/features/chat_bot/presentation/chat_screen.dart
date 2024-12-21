import 'package:bsc/features/chat_bot/presentation/bloc/chat_bloc.dart';
import 'package:bsc/features/chat_bot/presentation/bloc/chat_event.dart';
import 'package:bsc/features/chat_bot/presentation/bloc/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _promptCon = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ChatBloc(),
        child: Column(
          children: [
            // Static top content
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset('assets/hand_hi.png', height: 100),
                  const SizedBox(height: 16),
                  Text(
                    'Bonjour Mohamed!',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff495CF5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Je suis là pour t’aider à trouver les meilleurs plans pour ton séjour !',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Message list area
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ChatErrorState) {
                    return Center(child: Text(state.error));
                  }

                  if (state is ChatSuccessState) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: state.messages.length,
                      reverse: true, // Show the latest message at the bottom
                      itemBuilder: (context, index) {
                        final message =
                            state.messages[state.messages.length - 1 - index];
                        final isUser = message['role'] == 'user';

                        return Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? const Color(0xff495CF5)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              message['message']!,
                              style: GoogleFonts.inter(
                                color: isUser ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(child: Text('Start a conversation!'));
                },
              ),
            ),

            // Input area
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _promptCon,
                decoration: InputDecoration(
                  hintText: 'Write your message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Color(0xff495CF5)),
                    onPressed: () {
                      final userMessage = _promptCon.text.trim();
                      if (userMessage.isEmpty) return;
                      BlocProvider.of<ChatBloc>(context)
                          .add(SendMessageEvent(userMessage));
                      _promptCon.clear();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
