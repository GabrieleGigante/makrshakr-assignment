import 'dart:developer';
import 'package:assignment/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/fact.dart';

class FactsProvider extends ChangeNotifier {
  List<Fact> facts = [];
  bool isLoading = false;
  late int _pageNumber;
  String? error;

  FactsProvider(int? pageNumber) {
    pageNumber ??= 1;
    _pageNumber = pageNumber;
    getFacts(pageNumber);
  }

  // setters
  setLoading(bool loadingStatus) {
    if (loadingStatus == true) {
      setError(null);
    }
    isLoading = loadingStatus;
    notifyListeners();
  }

  setError(String? errorMessage) {
    error = errorMessage;
  }

  setFacts(List<Fact> newFacts) {
    facts = newFacts;
  }
  //-------

  getFacts(int pageNumber) async {
    _pageNumber = pageNumber;
    setLoading(true);
    // await Future.delayed(const Duration(seconds: 2), () {});
    try {
      Response res = await Dio().get('$api/facts');

      Iterable list = res.data['data'];
      facts = [];
      for (Map<String, dynamic> item in list) {
        facts.add(Fact.fromMap(item)
            .copyWith(image: 'https://placekitten.com/50/50?image=${facts.length % 16}'));
      }
    } catch (e) {
      setError(e.toString());
    }
    setLoading(false);
  }

  getFact(int index) {
    if (facts.isEmpty) {
      getFacts(_pageNumber);
    }
    return facts[index];
  }
}
