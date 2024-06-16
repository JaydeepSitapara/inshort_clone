
import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/data/model/article_model.dart';
import 'package:inshorts_clone/data/services/api_services.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashBoardState();
  }
}

class _DashBoardState extends State<DashBoard> {
  List<Articles> articles = [];

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  void getArticles() async {
    var response = await ApiServices.getArticles();

    setState(() {
      articles = response['data'];
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inshort'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TransformerPageView(
          loop: false,
          scrollDirection: Axis.vertical,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            var article = articles[index];
            return Card(
              elevation: 1,
              borderOnForeground: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterLogo(
                    size: 300,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${article.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${article.content}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
            ],
              ),
            );
          },
        ),
      ),
    );
  }
}
