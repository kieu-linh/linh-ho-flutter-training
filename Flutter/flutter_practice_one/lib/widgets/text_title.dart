import 'package:flutter/material.dart';

class FAText extends StatelessWidget {
  const FAText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(children: <TextSpan>[
        TextSpan(
          text: 'PRO ',
          style: TextStyle(
              color: Colors.black, fontSize: 48.0, fontWeight: FontWeight.w700),
        ),
        TextSpan(
          text: 'FITNESS',
          style: TextStyle(color: Color(0xFFB0C929), fontSize: 48.0),
        ),
      ]),
    );
  }
}
