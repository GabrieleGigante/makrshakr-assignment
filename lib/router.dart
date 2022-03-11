import 'package:assignment/pages/details_page.dart';
import 'package:assignment/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<MaterialPageRoute>? router(RouteSettings settings) {
  final Uri uri = Uri.parse(settings.name ?? '');
  print('new route: ' + uri.path.toString());
  // home / listview route
  if (uri.path == '/') {
    return MaterialPageRoute(
      builder: (_) => const ListPage(pageNumber: 1),
      settings: const RouteSettings(name: '/1'),
    );
  }
  // listview route
  if (uri.pathSegments.length == 1 && int.tryParse(uri.pathSegments[0]) != null) {
    int pageNumber = int.parse(uri.pathSegments[0]);
    return PageTransition(
        type: settings.arguments.toString() == 'back'
            ? PageTransitionType.leftToRight
            : PageTransitionType.rightToLeft,
        child: ListPage(
          pageNumber: pageNumber,
        ),
        settings: RouteSettings(name: '/$pageNumber'));
  }

  // details route
  if (uri.pathSegments.length == 2 &&
      int.tryParse(uri.pathSegments[0]) != null &&
      int.tryParse(uri.pathSegments[1]) != null) {
    int pageNumber = int.parse(uri.pathSegments[0]);
    int postNumber = int.parse(uri.pathSegments[1]);
    return PageTransition(
        type: PageTransitionType.leftToRight,
        child: DetailsPage(
          pageNumber: pageNumber,
          postNumber: postNumber,
        ),
        settings: RouteSettings(name: '/$pageNumber/$postNumber'));
  }
  return null;
}
