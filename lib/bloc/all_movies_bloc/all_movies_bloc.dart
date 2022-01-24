import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp2/model/movie.dart';
import 'package:movieapp2/model/movie_response.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'all_movies_event.dart';
part 'all_movies_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required this.movieRepository}) : super(const MovieState()) {
    on<MovieFetched>(
      _onMovieFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final MovieRepository movieRepository;
  int totalData = 0;

  Future<void> _onMovieFetched(
    MovieFetched event,
    Emitter<MovieState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == MovieStatus.initial) {
        final movies = await _fetchMovies(1);
        return emit(state.copyWith(
            status: MovieStatus.success,
            movies: movies,
            hasReachedMax: false,
            page: 1));
      }
      final movies = await _fetchMovies(state.page + 1);
      totalData == movies.length
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: MovieStatus.success,
                movies: List.of(state.movies)..addAll(movies),
                page: state.page + 1,
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  Future<List<Movie>> _fetchMovies(int page) async {
    MovieResponse movieResponse = await movieRepository.getMovies(page);

    if (!movieResponse.hasError) {
      totalData = movieResponse.totalResults;
      return movieResponse.movies;
    }
    throw Exception('error fetching movies');
  }
}
