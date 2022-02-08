import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/popular_movies_bloc/popular_movies_cubit.dart';
import 'package:movieapp2/repositories/movie_repository.dart';

import '../movie_widgets_loader.dart';
import '../movies_list_horizontal.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PopularMovieCubit(
        repository: context.read<MovieRepository>(),
      )..fetchList(),
      child: const PopularMovieView(),
    );
  }
}

class PopularMovieView extends StatelessWidget {
  const PopularMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PopularMovieCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        if (state.movies.isEmpty) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      "No More Popular Movies",
                      style: TextStyle(color: Colors.black45),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return MoviesListHorizontal(movies: state.movies);
        }
      default:
        return buildMovielistLoaderWidget(context);
    }
  }
}
