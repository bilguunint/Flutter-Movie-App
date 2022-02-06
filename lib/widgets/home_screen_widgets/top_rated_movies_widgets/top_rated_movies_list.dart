import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../bloc/top_rated_movies_bloc/top_rated_movies_cubit.dart';
import '../movie_widgets_loader.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopRatedCubit(
        repository: context.read<MovieRepository>(),
      )..fetchTopRated(),
      child: const TopRatedMovieView(),
    );
  }
}

class TopRatedMovieView extends StatelessWidget {
  const TopRatedMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TopRatedCubit>().state;
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
                      "No More Top Rated Movies",
                      style: TextStyle(color: Colors.black45),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return Container(
            height: 150.0,
            padding: const EdgeInsets.only(left: 10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, right: 15.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: Stack(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.white10,
                                highlightColor: Colors.white30,
                                enabled: true,
                                child: SizedBox(
                                  height: 140.0,
                                  child: AspectRatio(
                                      aspectRatio: 2 / 3,
                                      child: Container(
                                          decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.black12,
                                      ))),
                                ),
                              ),
                              SizedBox(
                                height: 140.0,
                                child: AspectRatio(
                                    aspectRatio: 2 / 3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: FadeInImage.memoryNetwork(
                                          fit: BoxFit.cover,
                                          placeholder: kTransparentImage,
                                          image:
                                              "https://image.tmdb.org/t/p/w200/" +
                                                  state.movies[index].poster),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      default:
        return buildMovielistLoaderWidget(context);
    }
  }
}
