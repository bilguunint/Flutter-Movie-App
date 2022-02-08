import 'package:flutter/material.dart';
import 'package:movieapp2/bloc/theme_bloc/theme_controller.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:movieapp2/style/custom_theme.dart';

import 'screens/main_screen.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: themeController.themeMode,
          home: MainScreen(
            themeController: themeController,
            movieRepository: movieRepository,
          ),
        );
      },
    );
  }
}
