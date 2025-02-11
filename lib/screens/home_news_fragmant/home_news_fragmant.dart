import 'package:flutter/material.dart';
import 'package:news_app_/Api/api_manager.dart';
import 'package:news_app_/screens/articles/articles_screen.dart';

class HomeNewsFragment extends StatelessWidget {
  const HomeNewsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Try Again'),
              )
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == "error") {
          return Column(
            children: [
              Text(response?.message ?? ''),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Try Again'),
              )
            ],
          );
        }
        return ArticlesScreen(
          response?.sources,
        );
      },
    );
  }
}
