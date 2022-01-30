part of 'upcoming_cubit.dart';

enum ListStatus { loading, success, failure }

class UpComingState extends Equatable {
  const UpComingState._({
    this.status = ListStatus.loading,
    this.movies = const <Movie>[],
  });

  const UpComingState.loading() : this._();

  const UpComingState.success(List<Movie> movies)
      : this._(status: ListStatus.success, movies: movies);

  const UpComingState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies];
}
