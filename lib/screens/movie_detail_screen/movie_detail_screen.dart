import 'package:flutter/material.dart';
import 'package:movieapp2/bloc/theme_bloc/theme_controller.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:movieapp2/widgets/movie_detail_widgets/movie_detail_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen(
      {Key? key,
      required this.movieId,
      required this.themeController,
      required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return MovieDetailWidget(
      movieId: movieId,
      movieRepository: movieRepository,
      themeController: themeController,
    );
  }
}
