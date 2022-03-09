import 'dart:io';

import 'package:assignment/models/fact.dart';
import 'package:assignment/providers/facts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/fact_card.dart';

class ListPage extends StatelessWidget {
  final int pageNumber;
  const ListPage({Key? key, this.pageNumber = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FactsProvider provider = context.watch<FactsProvider>();
    final List<Fact> facts = provider.facts;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      ),
      body: Builder(builder: (context) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (provider.error != null) {}
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: facts.length,
          itemBuilder: (BuildContext context, int i) => FactCard(i, onPressed: () {}),
          separatorBuilder: (BuildContext context, int i) => const SizedBox(height: 6),
          // children: [for (int i = 0; i < facts.length; i++) FactCard(i, onPressed: () {})],
        );
      }),
      bottomNavigationBar: provider.isLoading
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (pageNumber > 1)
                      TextButton(
                        onPressed: () async {
                          provider.getFacts(pageNumber - 1);
                          Navigator.pushReplacementNamed(
                            context,
                            '/${pageNumber - 1}/',
                            arguments: 'back',
                          );
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      )
                    else
                      const SizedBox(width: 60),
                    Text('$pageNumber'),
                    TextButton(
                      onPressed: () async {
                        provider.getFacts(pageNumber + 1);
                        Navigator.pushReplacementNamed(
                          context,
                          '/${pageNumber + 1}/',
                          arguments: 'forward',
                        );
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
