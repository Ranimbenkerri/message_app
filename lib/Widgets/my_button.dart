import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.colorbtn,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color colorbtn;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(6),
        color: colorbtn,
        child: MaterialButton(
          minWidth: double.infinity,
          onPressed: onPressed,
          child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 20),),
          
        ),
      ),
    );
  }
}
