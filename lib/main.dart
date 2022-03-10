import 'package:assignment/pages/unknown_route.dart';
import 'package:assignment/providers/facts_provider.dart';
import 'package:assignment/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          FactsProvider(int.tryParse(ModalRoute.of(context)?.settings.name?.split('/')[1] ?? '1')),
      child: MaterialApp(
        title: 'Makr Shakr assignment',
        theme: ThemeData(
          primarySwatch: Colors.red,
          // textButtonTheme:
          //     TextButtonThemeData(style: TextButton.styleFrom(maximumSize: Size.fromWidth(35))),
        ),
        onGenerateRoute: router,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (_) => UnknownRoute(route: settings.name ?? '')),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
