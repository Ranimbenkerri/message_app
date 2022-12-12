// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:message_app/Screens/chat_screen.dart';
import 'package:message_app/Widgets/my_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:message_app/services/auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const screenRoute = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationScreen> {
  AuthService authService = AuthService();

  late String email;
  late String password;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: Image.asset('images/logo.png'),
                    ),
                    const Text(
                      'Message Me',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: authService.email,
                  keyboardType: TextInputType.emailAddress,
                  // onChanged: (value) {
                  //   email = value;
                  // },
                  decoration: const InputDecoration(
                    hintText: 'Enter your Gmail',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: authService.password,
                  // onChanged: (value) {
                  //   password = value;
                  // },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                    text: 'Registre',
                    colorbtn: Colors.blue[800]!,
                    onPressed: () async {
                      if(authService.email != '' && authService.password != '')
                      {
                        authService.registreuser(context);
                        Navigator.pushNamed(context, ChatScreen.screenRoute);
                      }
                      setState(() {
                        spinner = true;
                      });
                    }),
              ]),
        ),
      ),
    );
  }
}
