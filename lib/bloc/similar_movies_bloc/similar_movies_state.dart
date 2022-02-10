part of 'similar_movies_cubit.dart';

enum ListStatus { loading, success, failure }

class SimilarMoviesState extends Equatable {
  const SimilarMoviesState._({
    this.status = ListStatus.loading,
    this.movies = const <Movie>[],
  });

  const SimilarMoviesState.loading() : this._();

  const SimilarMoviesState.success(List<Movie> movies)
      : this._(status: ListStatus.success, movies: movies);

  const SimilarMoviesState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies];
}