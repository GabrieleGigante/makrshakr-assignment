import 'dart:developer';

import 'package:assignment/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/fact.dart';
import '../models/link.dart';

class FactsProvider extends ChangeNotifier {
  List<Fact> facts = [];
  List<Link> links = [];
  bool isLoading = false;
  late int pageNumber;
  String? error;

  FactsProvider(this.pageNumber) {
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
    this.pageNumber = pageNumber;
    setLoading(true);
    // await Future.delayed(const Duration(seconds: 2), () {});
    try {
      Response res = await Dio().get('$api/facts?page=$pageNumber');

      Iterable factList = res.data['data'];
      facts = [];
      for (Map<String, dynamic> item in factList) {
        facts.add(Fact.fromMap(item)
            .copyWith(image: 'https://placekitten.com/50/50?image=${facts.length % 16}'));
      }

      Iterable linkList = res.data['links'];
      links = [];
      for (Map<String, dynamic> link in linkList) {
        links.add(Link.fromMap(link));
      }
    } on DioError catch (e) {
      setError(e.message);
    } catch (e) {
      setError(e.toString());
    }
    setLoading(false);
  }

  Fact getFact(int index) {
    if (facts.isEmpty) {
      getFacts(pageNumber);
    }
    if (index > facts.length - 1) {
      setError('ERROR 404: post not found');
      return facts.first;
    }
    return facts[index];
  }

  getPrevious(BuildContext context) {
    final int newPage = pageNumber - 1;
    getFacts(newPage);
    Navigator.pushReplacementNamed(
      context,
      '/$newPage',
      arguments: 'back',
    );
  }

  getNext(BuildContext context) {
    final int newPage = pageNumber + 1;
    getFacts(newPage);
    Navigator.pushReplacementNamed(
      context,
      '/$newPage',
      arguments: 'forward',
    );
  }
}
