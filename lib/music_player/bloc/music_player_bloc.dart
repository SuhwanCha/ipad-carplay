import 'package:bloc/bloc.dart';
import 'package:ipad_carplay/music_player/models/music_model.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

/// The music player bloc.
class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  /// Creates a new music player bloc.
  MusicPlayerBloc()
      : super(const MusicPlayerState(status: MusicPlayerStatus.stopped)) {
    on<MusicPlayerEvent>((event, emit) {});
  }
}
