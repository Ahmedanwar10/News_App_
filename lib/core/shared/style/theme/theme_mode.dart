import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_/logic/bloc/theme_cubit.dart';

class FinalView extends StatelessWidget {
  const FinalView({super.key});

  final List<(String, ThemeMode)> _themes = const [
    ('Dark', ThemeMode.dark),
    ('Light', ThemeMode.light),
    ('System', ThemeMode.system),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Theme"),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, selectedTheme) {
            return ListView.builder(
              itemCount: _themes.length,
              itemBuilder: (context, index) {
                final String label = _themes[index].$1;
                final ThemeMode theme = _themes[index].$2;

                return ListTile(
                  title: Text(
                    label,
                    style: TextStyle(
                      fontWeight: selectedTheme == theme ? FontWeight.bold : null,
                    ),
                  ),
                  onTap: () => context.read<ThemeCubit>().updateTheme(theme),
                  trailing: selectedTheme == theme
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
