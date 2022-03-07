import 'package:assignment/pages/unknown_route.dart';
import 'package:assignment/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makr Shakr assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => UnknownRoute(route: settings.name ?? '')),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
