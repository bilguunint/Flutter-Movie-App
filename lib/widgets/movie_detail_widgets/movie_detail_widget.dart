import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/theme_bloc/theme_controller.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

import 'movie_detail_view.dart';

class MovieDetailWidget extends StatefulWidget {
  const MovieDetailWidget(
      {Key? key,
      required this.themeController,
      required this.movieRepository,
      required this.movieId})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;
  final int movieId;

  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.movieRepository,
      child: MovieDetailView(
        themeController: widget.themeController,
        movieRepository: widget.movieRepository,
        movieId: widget.movieId,
      ),
    );
  }
}
