import 'package:flutter/material.dart';
import 'package:message_app/Screens/registration.dart';
import 'package:message_app/Screens/welcome_screen.dart';
import 'Screens/SignIn_screen.dart';
import 'Screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message me',
      initialRoute: _auth.currentUser != null
          ? ChatScreen.screenRoute
          : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
        SignIn.screenRoute: (context) => const SignIn(),
        RegistrationScreen.screenRoute: (context) => const RegistrationScreen(),
        ChatScreen.screenRoute: (context) => const ChatScreen(),
      },
    );
  }
}
