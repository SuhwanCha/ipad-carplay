part of 'music_player_bloc.dart';

/// The music player event.
abstract class MusicPlayerEvent {
  /// Creates a new music player event.
  const MusicPlayerEvent();
}

/// The event to play the music.
class MusicPlayerPlayed extends MusicPlayerEvent {
  /// Creates a new play music event.
  const MusicPlayerPlayed(this.music);

  /// The music to play.
  final Music music;
}

/// The event to resume the music.
class MusicPlayerResumed extends MusicPlayerEvent {
  /// Creates a new resume music event.
  const MusicPlayerResumed();
}

/// The event to pause the music.
class MusicPlayerPaused extends MusicPlayerEvent {
  /// Creates a new pause music event.
  const MusicPlayerPaused();
}

/// The event to stop the music.
class MusicPlayerStopped extends MusicPlayerEvent {
  /// Creates a new stop music event.
  const MusicPlayerStopped();
}

/// The event to seek the music.
class MusicPlayerSeeked extends MusicPlayerEvent {
  /// Creates a new seek music event.
  const MusicPlayerSeeked(this.position);

  /// The position to seek.
  final Duration position;
}
