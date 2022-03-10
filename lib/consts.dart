import 'package:flutter/material.dart';

const String api = 'https://catfact.ninja';

ThemeData catfactsTheme(context) => ThemeData(
      primarySwatch: Colors.red,
      cardColor: Colors.white,
      textTheme: const TextTheme(
        titleSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 12),
        labelSmall: TextStyle(fontSize: 11),
      ),
      appBarTheme: const AppBarTheme(),
    );
