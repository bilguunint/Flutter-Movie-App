import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:movieapp2/bloc/upcoming_bloc/upcoming_cubit.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

import 'upcoming_loader.dart';

class UpComingSlider extends StatelessWidget {
  const UpComingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpComingCubit(
        repository: context.read<MovieRepository>(),
      )..fetchUpComing(),
      child: const UpComingView(),
    );
  }
}

class UpComingView extends StatelessWidget {
  const UpComingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UpComingCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        return Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1.0,
                aspectRatio: 2 / 2.8,
                enlargeCenterPage: true,
              ),
              items: state.movies
                  .map((movie) => Stack(
                        children: [
                          Stack(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.black87,
                                highlightColor: Colors.white54,
                                enabled: true,
                                child: const AspectRatio(
                                    aspectRatio: 2 / 2.8,
                                    child: Icon(
                                      FontAwesome5.film,
                                      color: Colors.black26,
                                      size: 40.0,
                                    )),
                              ),
                              AspectRatio(
                                  aspectRatio: 2 / 2.8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: FadeInImage.memoryNetwork(
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        placeholder: kTransparentImage,
                                        image:
                                            "https://image.tmdb.org/t/p/original/" +
                                                movie.poster),
                                  )),
                            ],
                          ),
                          AspectRatio(
                            aspectRatio: 2 / 2.8,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: const [
                                      0.0,
                                      0.4,
                                      0.4,
                                      1.0
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(1.0),
                                      Colors.black.withOpacity(0.0),
                                      Colors.black.withOpacity(0.0),
                                      Colors.black.withOpacity(0.7),
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 5.0,
                              right: 10.0,
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Release date: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      movie.releaseDate,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ))
                  .toList(),
            ),
            Positioned(
                left: 10.0,
                top: 10.0,
                child: SafeArea(
                  child: Text(
                    "Upcoming movies",
                    style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 18.0,
                        color: Colors.white.withOpacity(0.5)),
                  ),
                )),
          ],
        );
      default:
        return buildLoadingCampaignsWidget(context);
    }
  }
}
