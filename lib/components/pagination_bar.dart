import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/link.dart';
import '../providers/facts_provider.dart';

class PaginationBar extends StatelessWidget {
  const PaginationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FactsProvider provider = context.read<FactsProvider>();
    final List<Link> links = provider.links;
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final Link link in links)
            Builder(
              builder: ((context) {
                if (link.label.toLowerCase() == 'previous') {
                  bool isFirstPage = link.url.isEmpty;
                  return Flexible(
                    child: TextButton(
                      onPressed: isFirstPage ? null : () => provider.getPrevious(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  );
                }
                if (link.label.toLowerCase() == 'next') {
                  bool isLastPage = link.url.isEmpty;
                  return Flexible(
                    child: TextButton(
                      onPressed: isLastPage ? null : () => provider.getNext(context),
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                }
                if (link.active) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      link.label,
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  );
                }
                if (link.url.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      link.label,
                      style: TextStyle(fontSize: 11),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    provider.getFacts(int.parse(link.label));
                    Navigator.pushNamed(
                        context, ModalRoute.of(context)!.settings.name! + link.label);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      link.label,
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              }),
            )
        ],
      ),
    );
  }
}
