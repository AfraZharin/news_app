

import 'package:flutter/material.dart';
import 'package:news_app/Article_model.dart';
class nwsss1 extends StatelessWidget {
  final Article? article;

  nwsss1({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(article!.title.toString(),style:
              TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),),
            SizedBox(height: 20,),
            article!.urlToImage.toString()!=null?
            Container(
              height: 400,
              width: 500,
              child: Image.network(article!.urlToImage.toString(),fit: BoxFit.cover,),
            ):
            Container(
              height: 400,
              width: 500,
              child: Image.network("",fit: BoxFit.cover,),),


            SizedBox(height: 20,),
            Container(
              child: Text(article!.description.toString(),style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),),
            ),
          ],
        ),

      ));
  }
}
