part of 'movie_detail_cubit.dart';

enum ListStatus { loading, success, failure }

class MovieDetailState extends Equatable {
  const MovieDetailState._({
    this.status = ListStatus.loading,
    this.movie = MovieDetail.empty,
  });

  const MovieDetailState.loading() : this._();

  const MovieDetailState.success(MovieDetail movie)
      : this._(status: ListStatus.success, movie: movie);

  const MovieDetailState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final MovieDetail movie;

  @override
  List<Object> get props => [status, movie];
}
