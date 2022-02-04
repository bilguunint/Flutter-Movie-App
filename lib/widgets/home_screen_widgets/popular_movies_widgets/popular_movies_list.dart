import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/popular_movies_bloc/popular_movies_cubit.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:movieapp2/widgets/home_screen_widgets/upcoming_widgets/upcoming_loader.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

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
      return Container(
        height: 260.0,
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.0)
                                          ),
                      child: Stack(
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: Colors.white70,
                                            highlightColor: Colors.white30,
                                            enabled: true,
                                            child: SizedBox(
                                              height: 200.0,
                                              child: AspectRatio(
                                                  aspectRatio: 2 / 3,
                                                  child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                    color: Colors.black12,
                                                  ))),
                                            ),
                                          ),
                                          SizedBox(
                                            
                                            height: 200.0,
                                            child: AspectRatio(
                                                aspectRatio: 2 / 3,
                                                child: FadeInImage.memoryNetwork(
                                                  
                                                  fit: BoxFit.cover,
                                                    placeholder:
                                                        kTransparentImage,
                                                    image:
                                                        "https://image.tmdb.org/t/p/w200/" +
                                                            state.movies[index]
                                                                .poster)),
                                          ),
                                        ],
                                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        state.movies[index].title,
                        maxLines: 2,
                        style: const TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0),
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
        return Container();
    }
  }
}
