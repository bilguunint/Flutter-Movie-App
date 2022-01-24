part of 'movie_list_cubit.dart';

enum ListStatus { loading, success, failure }

class MovieListState extends Equatable {
  const MovieListState._({
    this.status = ListStatus.loading,
    this.movies = const <Movie>[],
  });

  const MovieListState.loading() : this._();

  const MovieListState.success(List<Movie> movies)
      : this._(status: ListStatus.success, movies: movies);

  const MovieListState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies];
}