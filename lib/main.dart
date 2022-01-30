import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/theme_bloc/theme_controller.dart';
import 'package:movieapp2/bloc/theme_bloc/theme_service.dart';
import 'app.dart';
import 'bloc/all_movies_bloc/all_movies_bloc.dart';
import 'repositories/movie_repository.dart';
import 'screens/movies_list.dart';

void main() async {
  final movieRepository = MovieRepository();
  final themeController = ThemeController(ThemeService());
  await themeController.loadSettings();
  runApp(App(
    themeController: themeController,
    movieRepository: movieRepository,
  ));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  const MyApp({Key? key, required this.movieRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Posts')),
        body: BlocProvider(
          create: (_) =>
              MovieBloc(movieRepository: movieRepository)..add(MovieFetched()),
          child: const MoviesList(),
        ),
      ),
    );
  }
}
