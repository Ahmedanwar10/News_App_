import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_/Api/api_model/everything_model/everything_response/everything_response.dart';
import 'package:news_app_/Api/api_model/sources_model/sources_responce/sources_responce.dart';

class ApiManager {
  static const String baseurl = "newsapi.org";
  static const String apiKey = "e4f6b28b046c40ada055aba054286699";
  static Future<SourcesResponse> getNewsSources() async {
    var url =
        Uri.https(baseurl, "/v2/top-headlines/sources", {"apiKey": apiKey});
    var response = await http.get(url);
    var sourcesResponse = SourcesResponse.fromJson(jsonDecode(response.body));
    return sourcesResponse;
  }
static Future<EverythingResponse> getNewsList(String sourceId) async {
  var url = Uri.https(baseurl, "/v2/everything", {
    "apiKey": apiKey,
    "sources": sourceId,
  });

  var response = await http.get(url);
  var data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return EverythingResponse.fromJson(data);
  } else {
    throw Exception("Failed to load news: ${data['message']}");
  }
}

}

//https:///v2/top-headlines/sources?apiKey=
//https:///v2/everything?q=bitcoin&apiKey=
