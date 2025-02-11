import 'package:flutter/material.dart';
import 'package:news_app_/model/category.dart';
import 'package:news_app_/screens/articles/articles_screen.dart';
import 'package:news_app_/screens/home_news_fragmant/home_news_fragmant.dart';

import '../../screens/cateogries_screen/categories_screen.dart';
import '../../screens/settings/settings_screen.dart';

class HomeLayout extends StatefulWidget {
  static String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  CategoryModel? selectedCategory;
  bool selectedSettings = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  "News App",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  selectedCategory = null;
                  selectedSettings = false;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/categories.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Categories",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  selectedSettings = true;
                  selectedCategory = null;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/settings.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(selectedCategory == null
              ? selectedSettings
                  ? "Settings"
                  : "News App"
              : selectedCategory!.title),
          actions: selectedCategory == null
              ? null
              : [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_rounded,
                        size: 40,
                      ))
                ],
        ),
        body: selectedCategory == null
            ? selectedSettings
                ? SettingsScreen()
                : CategoriesScreen(SelectCategory)
            : HomeNewsFragment(),
      ),
    );
  }

  SelectCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
