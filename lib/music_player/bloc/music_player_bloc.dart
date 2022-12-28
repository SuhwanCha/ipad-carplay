import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc()
      : super(const MusicPlayerState(status: MusicPlayerStatus.stopped)) {
    on<MusicPlayerEvent>((event, emit) {});
  }
}
