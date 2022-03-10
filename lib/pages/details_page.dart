import 'package:assignment/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final int pageNumber;
  final int postNumber;
  const DetailsPage({Key? key, required this.pageNumber, required this.postNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, showLeading: true),
      body: Builder(builder: (BuildContext context) {
        return Container();
      }),
    );
  }
}
