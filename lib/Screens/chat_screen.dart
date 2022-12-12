import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:message_app/services/auth.dart';
import 'package:message_app/Screens/welcome_screen.dart';
import '../Widgets/message_line.dart';

final _firestore = FirebaseFirestore.instance;
late User signeinuser;

class ChatScreen extends StatefulWidget {
  static const screenRoute = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool spinner = false;
  String? messageText; // the message
  @override
  void initState() {
    super.initState();
    getCurrentuser();
  }

  void getCurrentuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signeinuser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessage()async{
  //  final messages = await _firestore.collection('messages').get();
  //  for (var message in messages.docs){
  //    print(message.data());
  //  }
  // }

  // void messagesStreams() async {
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        actions: [
          IconButton(
            onPressed: () {
              authService.logoutuser();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (c) => const WelcomeScreen()),
                  (route) => false);
              print('logout');
            },
            icon: const Icon(Icons.close),
          ),
        ],
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Message me'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessageStreamBuilder(),
            Container(
              decoration: const BoxDecoration(),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      hintText: 'Enter your text here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    messageTextController.clear();
                    _firestore.collection('messages').add({
                      'text': messageText,
                      'sender': signeinuser.email,
                      'time': FieldValue.serverTimestamp(),
                    });
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<Widget> messageWidgets = [];
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser = signeinuser.email;
            final messageWidget = MessageLine(
              text: messageText,
              sender: messageSender,
              isMe: currentUser == messageSender,
            );
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );
        });
  }
}
