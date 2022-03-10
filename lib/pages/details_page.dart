import 'package:assignment/components/app_bar.dart';
import 'package:assignment/providers/facts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/fact.dart';

class DetailsPage extends StatelessWidget {
  final int pageNumber;
  final int postNumber;
  const DetailsPage({Key? key, required this.pageNumber, required this.postNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FactsProvider provider = context.watch<FactsProvider>();
    Fact fact = provider.getFact(postNumber);
    return Scaffold(
      appBar: appBar(context, showLeading: true),
      body: Builder(builder: (BuildContext context) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            Image.network(
              fact.image.replaceAll('50', '500'),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(fact.title),
            )
          ],
        );
      }),
    );
  }
}
