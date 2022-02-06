part of 'top_rated_movies_cubit.dart';

enum ListStatus { loading, success, failure }

class TopRatedState extends Equatable {
  const TopRatedState._({
    this.status = ListStatus.loading,
    this.movies = const <Movie>[],
  });

  const TopRatedState.loading() : this._();

  const TopRatedState.success(List<Movie> movies)
      : this._(status: ListStatus.success, movies: movies);

  const TopRatedState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies];
}
