import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String message;
  const ErrorComponent({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          './res/404cat.png',
          height: 175,
        ),
        const SizedBox(height: 32),
        Text(
          message,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
