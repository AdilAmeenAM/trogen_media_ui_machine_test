import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  final String message;
  final bool isSent;

  const ChatBubbleWidget(
      {super.key, required this.message, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSent ? Colors.white : Colors.indigo,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSent ? Colors.black : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
