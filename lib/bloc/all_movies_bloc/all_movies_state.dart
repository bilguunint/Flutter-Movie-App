part of 'all_movies_bloc.dart';

enum MovieStatus { initial, success, failure }

class MovieState extends Equatable {
  const MovieState(
      {this.status = MovieStatus.initial,
      this.movies = const <Movie>[],
      this.hasReachedMax = false,
      this.page = 0});

  final MovieStatus status;
  final List<Movie> movies;
  final bool hasReachedMax;
  final int page;

  MovieState copyWith(
      {MovieStatus? status,
      List<Movie>? movies,
      bool? hasReachedMax,
      int? page}) {
    return MovieState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page);
  }

  @override
  String toString() {
    return '''MovieState { status: $status, hasReachedMax: $hasReachedMax, movies: ${movies.length} }''';
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax, page];
}
