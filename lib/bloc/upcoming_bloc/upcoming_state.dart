part of 'upcoming_cubit.dart';

enum ListStatus { loading, success, failure }

class UpComingState extends Equatable {
  const UpComingState._({
    this.status = ListStatus.loading,
    this.movie = Movie.empty,
  });

  const UpComingState.loading() : this._();

  const UpComingState.success(Movie movie)
      : this._(status: ListStatus.success, movie: movie);

  const UpComingState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final Movie movie;

  @override
  List<Object> get props => [status, movie];
}