import 'dart:developer';

import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context, {bool showLeading = false}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: showLeading
        ? IconButton(
            onPressed: () {
              while (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              String newRoute =
                  ModalRoute.of(context)!.settings.name!.split('/').sublist(0, 2).join('/') + '/';
              Navigator.pushReplacementNamed(context, newRoute);
            },
            icon: const Icon(Icons.arrow_back_ios))
        : null,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          './res/appbarCat.png',
          height: 42,
        ),
        const Text(' CatFacts'),
      ],
    ),
  );
}
