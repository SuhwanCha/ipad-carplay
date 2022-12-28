/// The music model
class Music {
  /// Creates a new music model.
  Music({
    required this.title,
    required this.artist,
    required this.album,
    required this.albumArt,
    required this.duration,
  });

  /// The title of the music.
  ///
  /// ex) "The Sound of Silence"
  final String title;

  /// The artist of the music.
  ///
  /// ex) "Simon & Garfunkel"
  final String artist;

  /// The album of the music.
  ///
  /// ex) "Sounds of Silence"
  final String album;

  /// The album art of the music.
  ///
  /// ex) "https://example.com/album_art.jpg"
  final String albumArt;

  /// The duration of the music.
  ///
  /// ex) Duration(minutes: 3, seconds: 30)
  final Duration duration;
}

/// The music model for the now playing music.
class NowPlaying extends Music {
  /// Creates a new now playing music model.
  NowPlaying({
    required super.title,
    required super.artist,
    required super.album,
    required super.albumArt,
    required super.duration,
    required this.position,
  });

  /// The position of the music.
  final Duration position;
}
