import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp2/bloc/upcoming_bloc/upcoming_cubit.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
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
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2.8,
          child: Stack(
            children: [
              PageIndicatorContainer(
                align: IndicatorAlign.bottom,
                length: state.movies.take(5).length,
                indicatorSpace: 8.0,
                padding: const EdgeInsets.all(5.0),
                indicatorColor: Colors.white30,
                indicatorSelectorColor: CustomColors.mainColor,
                shape:
                    IndicatorShape.roundRectangleShape(size: const Size(8, 5)),
                child: PageView.builder(
                  itemCount: state.movies.take(5).length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.white54,
                                child: AspectRatio(
                                    aspectRatio: 3 / 2,
                                    child: Container(
                                        decoration: const BoxDecoration(
                                      color: Colors.black12,
                                    ))),
                              ),
                              AspectRatio(
                                  aspectRatio: 3 / 2,
                                  child: FadeInImage.memoryNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: kTransparentImage,
                                      image:
                                          "https://image.tmdb.org/t/p/original/" +
                                              state.movies[index].backPoster)),
                            ],
                          ),
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(1.0)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0, 1],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0.0,
                              left: 10.0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.white10,
                                          highlightColor: Colors.white30,
                                          enabled: true,
                                          child: SizedBox(
                                            height: 120.0,
                                            child: AspectRatio(
                                                aspectRatio: 2 / 3,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color: Colors.black12,
                                                ))),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          height: 120.0,
                                          child: AspectRatio(
                                              aspectRatio: 2 / 3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: FadeInImage.memoryNetwork(
                                                    placeholder:
                                                        kTransparentImage,
                                                    image:
                                                        "https://image.tmdb.org/t/p/w200/" +
                                                            state.movies[index]
                                                                .poster),
                                              )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          140,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            state.movies[index].title,
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Release date: " +
                                                    state.movies[index]
                                                        .releaseDate,
                                                style: const TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Upcoming movies".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      default:
        return buildLoadingCampaignsWidget(context);
    }
  }
}
