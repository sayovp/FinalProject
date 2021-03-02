import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bit/model/news.dart';
import 'package:intl/intl.dart';

class ApiService {
  String UrlForApi(optionUrl) {
    var formatter = new DateFormat("yyyy-MM-dd");
    String formattedDate = formatter.format(DateTime.now());

    switch (optionUrl) {
      //Top headlines from Colombia
      case 1:
        return 'https://newsapi.org/v2/top-headlines?country=co&apiKey=efdab8e8ef5046fb9a42f1ea15a5ae4e';
      //Top business headlines in the US right now
      case 2:
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=efdab8e8ef5046fb9a42f1ea15a5ae4e';
      //All articles mentioning Apple from yesterday, sorted by popular publishers first
      case 3:
        return 'https://newsapi.org/v2/everything?q=apple&from=$formattedDate&to=2021-02-18&sortBy=popularity&apiKey=efdab8e8ef5046fb9a42f1ea15a5ae4e';
      //Top headlines from TechCrunch right now
      case 4:
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=efdab8e8ef5046fb9a42f1ea15a5ae4e';
      //All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
      case 5:
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=efdab8e8ef5046fb9a42f1ea15a5ae4e';
      //All articles about Tesla from the last month, sorted by recent first
      case 6:
        return 'https://newsapi.org/v2/everything?q=tesla&from=$formattedDate&sortBy=publishedAt&apiKey=efdab8e8ef5046fb9a42f1ea15a5ae4e';
    }
  }

  GetDio({@required int optionUrl}) async {
    var dio = Dio();

    Response response = await dio.get(UrlForApi(optionUrl));

    if (response.statusCode == 200) {
      return NewsApiModel.fromjson(response.data);
    } else {
      print('Algo ha salido mal');
    }
  }
}
