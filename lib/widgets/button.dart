import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class Button extends StatefulWidget {
  final String buttonText;
  
  const Button({super.key, required this.buttonText});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: heraldGreen,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(2))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google.png'),
            const Text(
              "  Continue With Google",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
