part of 'all_movies_bloc.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieFetched extends MovieEvent {}