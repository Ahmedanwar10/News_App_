import 'package:flutter/material.dart';
import 'package:news_app_/layout/home/home_layout.dart';
import 'package:news_app_/shared/style/theme/myTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {HomeLayout.routeName: (context) => HomeLayout()},
      initialRoute: HomeLayout.routeName,
    );
  }
}
