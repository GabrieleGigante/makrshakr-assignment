import 'package:flutter/material.dart';

class UnknownRoute extends StatelessWidget {
  final String route;
  const UnknownRoute({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              './res/404cat.png',
              height: 175,
            ),
            const SizedBox(height: 32),
            Text(
              'ERROR 404: PAGE "$route" NOT FOUND',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
