import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback answerTap;
  final Color? boxColor;

  Answer({required this.answerText, required this.answerTap, this.boxColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: answerTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: boxColor,
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.blue, width: 1),
          fixedSize: Size(MediaQuery.of(context).size.width, 30.0)),
      child: Text(
        answerText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
