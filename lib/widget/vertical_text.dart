import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  final String text;

  const VerticalText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text
          .split('')
          .map(
            (letter) => Text(
          letter,
          textDirection: TextDirection.ltr,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      )
          .toList(),
    );
  }
}
