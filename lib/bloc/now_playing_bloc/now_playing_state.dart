part of 'now_playing_cubit.dart';

enum ListStatus { loading, success, failure }

class NowPlayingState extends Equatable {
  const NowPlayingState._({
    this.status = ListStatus.loading,
    this.movies = const <Movie>[],
  });

  const NowPlayingState.loading() : this._();

  const NowPlayingState.success(List<Movie> movies)
      : this._(status: ListStatus.success, movies: movies);

  const NowPlayingState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies];
}