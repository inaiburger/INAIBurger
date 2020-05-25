import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AllNews {
  final int id;
  final String title;
  // final String image;
  final String content;
  final String created;

  AllNews({
    this.title,
    this.id,
    // this.image,
    this.content,
    this.created,
  });

  factory AllNews.fromJson(Map<String, dynamic> json) {
    return AllNews(
        id: json['id'] as int,
        title: json['title'] as String,
        // image: json['thumb'] as String,
        content: json['text'] as String,
        created: json['date'] as String);
  }
}

Future<List<AllNews>> lfetchData(http.Client client) async {
  final lresponse = await client
      .get('https://sleepy-temple-85699.herokuapp.com/api/news/?format=json');
  return compute(lparseData, lresponse.body);
}

List<AllNews> lparseData(String lresponseBody) {
  final lparsed = json.decode(lresponseBody);
  return lparsed.map<AllNews>((json) => AllNews.fromJson(json)).toList();
}
