import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_machine_test/view/pages/flash_card_home_page.dart';
import 'package:ui_machine_test/view/widgets/chat_bubble_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> messages = [
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'received', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'received', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'received', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'received', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {'type': 'sent', 'text': 'Lorem Ipsum Is Simply Dummy'},
    {
      'type': 'received',
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry’s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.'
    },
  ];

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  bool _isTextFieldVisible = false;

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _toggleKeyboard() {
    setState(() {
      _isTextFieldVisible = !_isTextFieldVisible;
    });
    if (_isTextFieldVisible) {
      FocusScope.of(context).requestFocus(_focusNode); // Show keyboard
    } else {
      _focusNode.unfocus(); // Hide keyboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        actions: const [
          Icon(Icons.more_vert),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/profile_icon.png"),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("JOHN DOE", style: TextStyle(color: Colors.black)),
                Text("Online",
                    style: TextStyle(color: Colors.purple, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatBubbleWidget(
                  message: message['text']!,
                  isSent: message['type'] == 'sent',
                );
              },
            ),
          ),
          // Show the input field if _isTextFieldVisible is true
          if (_isTextFieldVisible)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                focusNode: _focusNode,
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      // Handle sending the message
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          const Icon(Icons.keyboard, size: 30),
          Image.asset("assets/images/profile_icon.png"),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const FlashCardHomePage();
                  },
                ));
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
        onTap: (index) {
          if (index == 0) {
            _toggleKeyboard(); // Toggle keyboard on the keyboard icon tap
          } else {
            setState(() {
              _isTextFieldVisible =
                  false; // Hide input field on other icon taps
            });
            _focusNode.unfocus(); // Hide keyboard on other icon taps
          }
        },
      ),
    );
  }
}
