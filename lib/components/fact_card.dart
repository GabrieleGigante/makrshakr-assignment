import 'package:flutter/material.dart';
import '../models/fact.dart';

class FactCard extends StatelessWidget {
  final Fact fact;
  final Function onPressed;
  const FactCard(this.fact, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fact fact = context.read<FactsProvider>().getFact(factIndex);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => onPressed(),
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
                        style: Theme.of(context).textTheme.titleSmall,
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
      ),
    );
  }
}
