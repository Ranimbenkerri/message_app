import 'package:flutter/material.dart';
import 'package:message_app/Screens/SignIn_screen.dart';
import 'package:message_app/Screens/registration.dart';
import '../Widgets/my_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String screenRoute = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                height: 30,
              ),
              CustomButton(
                text: 'Sign In',
                colorbtn: Colors.yellow[900]!,
                onPressed: () {
                  Navigator.pushNamed(context, SignIn.screenRoute);
                },
              ),
              CustomButton(
                text: 'Registre',
                colorbtn: Colors.blue[800]!,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.screenRoute);
                },
              ),
            ]),
      ),
    );
  }
}
