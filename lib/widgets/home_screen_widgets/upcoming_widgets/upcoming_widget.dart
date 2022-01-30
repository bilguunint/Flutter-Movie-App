import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/theme_bloc/theme_controller.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

import 'upcoming_slider.dart';

class UpComingWidget extends StatefulWidget {
  const UpComingWidget(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  _UpComingWidgetState createState() => _UpComingWidgetState();
}

class _UpComingWidgetState extends State<UpComingWidget> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.movieRepository,
      child: const UpComingSlider(),
    );
  }
}
