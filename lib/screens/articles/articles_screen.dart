import 'package:flutter/material.dart';
import 'package:news_app_/shared/style/componenets/article_item.dart';
import 'package:news_app_/shared/style/componenets/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  List<String> sources = [
    "BBC News",
    "CBC News",
    "ON News",
    "BEIN News",
    "SKY News",
    "AL jazeera News",
    "Nile News",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
                onTap: (index){
                  selectedIndex = index;
                  setState(() {

                  });
                },
                tabs: sources.map((source)=>TabItem(selectedIndex==sources.indexOf(source), source)).toList()
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context , index)=>ArticleItem(),
                  separatorBuilder: (context , index)=>SizedBox(
                    height: 30,
                  ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
