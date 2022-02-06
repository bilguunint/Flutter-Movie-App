import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp2/model/movie.dart';
import 'package:movieapp2/repositories/movie_repository.dart';
part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit({required this.repository})
      : super(const NowPlayingState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getNowPlaying(1);
      emit(NowPlayingState.success(movieResponse.movies));
    } on Exception {
      emit(const NowPlayingState.failure());
    }
  }
}