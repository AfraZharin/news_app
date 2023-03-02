import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news_app/Article_model.dart';
class Apiservice{
  Future<List<Article>> getArticle() async{
    final Url='https://newsapi.org/v2/everything?q=apple&from=2023-02-28&to=2023-02-28&sortBy=popularity&apiKey=6576b455089441189d3a3a02d0e5dfc9';

    var response=await http.get(Uri.parse(Url));
    if (response.statusCode==200) {
      var body = json.decode(response.body);
      List<Article>_data = List<Article>.from(
          body["articles"].map((e) => Article.fromJson(e)).toList()
      );      return _data;
    }
        else{
          List<Article> _data=[];
          return _data;
    }
      }

    }
