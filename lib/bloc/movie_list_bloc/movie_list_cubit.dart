import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp2/model/movie.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit({required this.repository})
      : super(const MovieListState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getMovies(1);
      emit(MovieListState.success(movieResponse.movies));
    } on Exception {
      emit(const MovieListState.failure());
    }
  }
}