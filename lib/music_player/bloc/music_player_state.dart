part of 'music_player_bloc.dart';

/// The status of the music player.
enum MusicPlayerStatus {
  /// The music player is playing.
  playing,

  /// The music player is paused.
  paused,

  /// The music player is stopped.
  stopped,
}

/// The state of the music player.
class MusicPlayerState {
  /// Creates a new music player state.
  const MusicPlayerState({
    required this.status,
    this.playlist = const [],
  });

  /// The status of the music player.
  final MusicPlayerStatus status;

  /// The playlist of the music player.
  final List<Music> playlist;
}
