import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/Screens/chat_screen.dart';

class AuthService {

  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginuser(context) async {

    try {
      showDialog(context: context, builder: (context) {
        return const AlertDialog(
          title:Center(
            child:CircularProgressIndicator(),
          )
        );
      });

      await auth
          .signInWithEmailAndPassword(
          email: email.text, password: password.text)
          .then(
            (value) => print('log in user'),
      );
      Navigator.pushNamed(context, ChatScreen.screenRoute);
    } catch (e) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Error Message'),
          content: Text(e.toString()),
        );
      });
    }
  }

  void registreuser(context) async {
    try {
      showDialog(context: context, builder: (context) {
        return const AlertDialog(
            title:Center(
              child:CircularProgressIndicator(),
            )
        );
      });
      await auth
          .createUserWithEmailAndPassword(
          email: email.text, password: password.text)
          .then(
            (value) => print('user regestrated'),
      );
    } catch (e) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Error Message'),
          content: Text(e.toString()),
        );
      });
    }
  }
  void logoutuser()async{
    await auth.signOut().then((value) => print('signout user'));
  }
}
