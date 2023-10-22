import 'package:chatmessengerapp/Components/chat_bubble.dart';
import 'package:chatmessengerapp/Components/my_text_field.dart';
import 'package:chatmessengerapp/Services/Auth/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only send message if not empty
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      //clear the input box after sent message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverUserEmail)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //messages
            Expanded(child: _buildMessageList()),

            //user input
            _buildMessageInput(),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiverUserID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
              children: snapshot.data!.docs
                  .map((document) => _buildMessageItem(document))
                  .toList());
        });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //align the messages to the right if the sender if the current user, other to the left
    var currentUsersMessage =
        data['senderId'] == _firebaseAuth.currentUser!.uid;
    var alignment =
        currentUsersMessage ? Alignment.centerRight : Alignment.centerLeft;
    var crossAxisAlignment =
        currentUsersMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    var mainAxisAlignment =
        currentUsersMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Container(
      padding: EdgeInsets.only(bottom: 3),
      alignment: alignment,
      child: Row(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (!currentUsersMessage)
              const Icon(Icons.person_outline, size: 40, color: Colors.amber),
            ChatBubble(
                currentUserMessage: currentUsersMessage,
                message: data['message']),
            if (currentUsersMessage)
              const Icon(Icons.person, size: 40, color: Colors.purple)
          ]),
    );
  }

  //build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        //textfeild for input
        Expanded(
            child: MyTextField(
          controller: _messageController,
          hintText: "Enter message",
          obscureText: false,
        )),
        //send button
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 40,
            ))
      ],
    );
  }
}
