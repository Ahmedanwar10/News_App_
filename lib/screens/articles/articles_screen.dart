// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app_/Api/api_model/sources_model/sources_responce/source.dart';
import 'package:news_app_/screens/articles/news_list_fragment.dart';
import 'package:news_app_/shared/style/componenets/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources;
  ArticlesScreen(
    this.sources,
  );
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sources
                        ?.map((source) => TabItem(
                            selectedIndex == widget.sources?.indexOf(source),
                            source))
                        ?.toList() ??
                    []),
            SizedBox(
              height: 20,
            ),
            Expanded(
  child: TabBarView(
    children: widget.sources?.map((source) {
      return NewsListFragment(sourceId: source.id ?? "");
    }).toList() ?? [],
  ),
)

          ],
        ),
      ),
    );
  }
}
