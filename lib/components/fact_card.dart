import 'package:assignment/providers/facts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/fact.dart';

class FactCard extends StatelessWidget {
  final int factIndex;
  final Function onPressed;
  const FactCard(this.factIndex, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fact fact = context.read<FactsProvider>().getFact(factIndex);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(fact.image),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fact.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text('Length: ${fact.length}')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
