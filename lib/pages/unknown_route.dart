import 'package:flutter/material.dart';

import '../components/error_widget.dart';

class UnknownRoute extends StatelessWidget {
  final String route;
  const UnknownRoute({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ErrorComponent(message: 'ERROR 404: PAGE "$route" NOT FOUND'),
      ),
    );
  }
}
