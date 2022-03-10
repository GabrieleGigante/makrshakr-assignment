import 'package:assignment/components/app_bar.dart';
import 'package:assignment/providers/facts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/fact_card.dart';
import '../components/pagination_bar.dart';
import '../models/fact.dart';

class ListPage extends StatelessWidget {
  final int pageNumber;
  const ListPage({Key? key, this.pageNumber = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FactsProvider provider = context.watch<FactsProvider>();
    final List<Fact> facts = provider.facts;

    return Scaffold(
      appBar: appBar(context),
      body: Builder(builder: (context) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (provider.error != null) {}
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: facts.length,
          itemBuilder: (BuildContext context, int i) =>
              FactCard(facts[i], onPressed: () => Navigator.pushNamed(context, '/$pageNumber/$i/')),
          separatorBuilder: (BuildContext context, int i) => const SizedBox(height: 6),
        );
      }),
      bottomNavigationBar: provider.isLoading ? null : const PaginationBar(),
    );
  }
}
