import 'article.dart';

class EverythingResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  EverythingResponse({this.status, this.totalResults, this.articles});

  factory EverythingResponse.fromJson(Map<String, dynamic> json) {
    return EverythingResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
