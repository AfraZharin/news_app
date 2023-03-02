import 'package:news_app/source.dart';

class Article{
  Source? source;
  String? title;
  String? urlToImage;
  String? description;

  Article({this.source,this.title,
  this.urlToImage,
  this.description});
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
      source: Source.fromJson(json['source']),
      title: json['title'],
      urlToImage: json['urlToImage'],
      description: json['"description'],

    );
  }

}
