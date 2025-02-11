// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/Api/api_model/everything_model/everything_response/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  
  ArticleItem(this.article);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: CachedNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: article.urlToImage ?? "No Image",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: 10),
        Text(article.title ?? "", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
        Text(article.description ?? "", style: TextStyle(color: Colors.black, fontSize: 14)),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: Text(article.publishedAt ?? "", style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }
}
