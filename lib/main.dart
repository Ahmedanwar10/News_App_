import 'package:flutter/material.dart';
import 'package:news_app_/bloc/theme_cubit.dart';
import 'package:news_app_/config/app_theme.dart';
import 'package:news_app_/layout/home/home_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_/shared/style/theme/theme_mode.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      
       child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: 'Flutter Demo',
             themeMode: mode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            debugShowCheckedModeBanner: false,
home: HomeLayout(),
routes: {
  HomeLayout.routeName: (context) => HomeLayout(),
  '/theme': (context) => FinalView(),
},
initialRoute: HomeLayout.routeName,
          );
        },
      ),
    );
  }
}
