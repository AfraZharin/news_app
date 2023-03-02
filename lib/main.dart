import 'package:flutter/material.dart';
import 'package:news_app/Article_model.dart';
import 'package:news_app/apiservice.dart';
import 'package:news_app/news1.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const News())
  );
}

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List txt=[" 2 BSF jawans attacked, weapons snatched by Bangladeshi villagers",
    "CIA chief on China's ability to invade Taiwan: ‘Xi has doubts about whether",
  "Gave Dhoni tips on captaincy. Asked me…': Virat Kohli's bizarre fan encounter"];
  List img=["phtos/bangladesh.jpg","phtos/cia.jpg","phtos/virakohli.jpg"];

  Apiservice client=Apiservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("News ",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Article>>(
          future: client.getArticle(),
          builder: (BuildContext, AsyncSnapshot<List<Article>>snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount:snapshot.data?.length ,
                  itemBuilder:(context,index){
                    var articles=snapshot.data![index];
                    return
                      InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=>nwsss1(article:articles)));
                      },
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              snapshot.data![index].toString()!=null?

                            Image.network(snapshot.data![index].urlToImage.toString(),
                              fit: BoxFit.cover,):
                              Image.network("",
                                fit: BoxFit.cover,),

                            SizedBox(height: 20,),
                            Text(snapshot.data![index].title.toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),),
                          ],),

                        ),
                      );

                  } );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },

        ),
      ),

    );
  }
}
