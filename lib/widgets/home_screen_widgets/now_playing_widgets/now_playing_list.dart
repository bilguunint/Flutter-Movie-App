import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:movieapp2/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../bloc/now_playing_bloc/now_playing_cubit.dart';
import '../movie_widgets_loader.dart';

class NowPlayingList extends StatelessWidget {
  const NowPlayingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NowPlayingCubit(
        repository: context.read<MovieRepository>(),
      )..fetchList(),
      child: const NowPlayingView(),
    );
  }
}

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NowPlayingCubit>().state;
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
