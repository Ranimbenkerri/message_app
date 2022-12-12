// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:message_app/Widgets/my_button.dart';
import 'package:message_app/services/auth.dart';

class SignIn extends StatefulWidget {
  static const screenRoute = 'sign_in';
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _RegistrationState();
}

class _RegistrationState extends State<SignIn> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your Password',
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
                  text: 'Sign In',
                  colorbtn: Colors.yellow[900]!,
                  onPressed: () async {

                    // ignore: unrelated_type_equality_checks
                    if (authService.password != "" && authService.email != "") {
                      authService.loginuser(context);
                    }
                  }),
            ]),
      ),
    );
  }
}
