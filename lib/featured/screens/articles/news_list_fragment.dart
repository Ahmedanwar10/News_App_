import 'package:flutter/material.dart';
import 'package:news_app_/logic/Api/api_manager.dart';
import 'package:news_app_/logic/Api/api_model/everything_model/everything_response/everything_response.dart';
import 'package:news_app_/core/shared/style/componenets/article_item.dart';
class NewsListFragment extends StatelessWidget {
  final String sourceId;

  const NewsListFragment({Key? key, required this.sourceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsList(sourceId), // استخدم معرف المصدر الصحيح
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {}, 
                child: const Text('Try Again'),
              ),
            ],
          );
        }
        var response = snapshot.data as EverythingResponse?;

        if (response?.status == "error") {
          return Column(
            children: [
              Text( 'Error'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Try Again'),
              ),
            ],
          );
        }

        var articles = response?.articles ?? [];
        if (articles.isEmpty) {
          return const Center(child: Text("No articles found"));
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) => ArticleItem(articles[index]),
        );
      },
    );
  }
}
