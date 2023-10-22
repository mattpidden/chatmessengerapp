import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool currentUserMessage;
  final String message;
  const ChatBubble(
      {super.key, required this.currentUserMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: currentUserMessage ? Colors.purple : Colors.amber),
        color: currentUserMessage
            ? const Color.fromARGB(7, 155, 39, 176)
            : const Color.fromARGB(7, 255, 193, 7),
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
