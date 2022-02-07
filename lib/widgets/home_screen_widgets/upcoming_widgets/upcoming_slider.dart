import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/upcoming_bloc/upcoming_cubit.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movieapp2/style/colors.dart';
import 'package:page_indicator/page_indicator.dart';
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
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1.0,
            aspectRatio: 2/2.6,
            enlargeCenterPage: true,
          ),
          items: state.movies
    .map((movie) => Stack(
      children: [
        AspectRatio(
          aspectRatio: 2 / 2.6,
          child: Image.network("https://image.tmdb.org/t/p/w500/" +
                                        movie.poster, 
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        ),
        ),
        AspectRatio(
                            aspectRatio: 2 / 2.6,
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
        
      ],
    ))
    .toList(),
        );
      default:
        return buildLoadingCampaignsWidget(context);
    }
  }
}
