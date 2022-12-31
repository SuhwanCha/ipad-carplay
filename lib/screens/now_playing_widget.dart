import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:nowplaying/nowplaying.dart';
import 'package:provider/provider.dart';

class NowPlayingWidget extends StatefulWidget {
  @override
  _NowPlayingWidgetState createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  void initState() {
    super.initState();
    NowPlaying.instance.isEnabled().then((bool isEnabled) async {
      if (!isEnabled) {
        final shown = await NowPlaying.instance.requestPermissions();
        print('MANAGED TO SHOW PERMS PAGE: $shown');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<NowPlayingTrack>.value(
      initialData: NowPlayingTrack(),
      value: NowPlaying.instance.stream,
      child: Consumer<NowPlayingTrack>(
        builder: (context, track, _) {
          return Stack(
            children: [
              if (track.image != null)
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: track.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: DecoratedBox(
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0)),
                      ),
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 280,
                        height: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: _imageFrom(track),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (!track.isStopped) ...[
                      if (track.title != null)
                        SizedBox(
                          height: 30,
                          child: Marquee(
                            text: track.title!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                            velocity: 30,
                            startAfter: const Duration(seconds: 2),
                            pauseAfterRound: const Duration(seconds: 1),
                          ),
                        ),
                      if (track.artist != null)
                        Text(
                          track.artist!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(
                        height: 10,
                      ),

                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          Container(
                            width: 312 *
                                (track.progress.inMilliseconds /
                                    track.duration.inMilliseconds),
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // if (track.album != null) Text(track.album!),
                      TrackProgressIndicator(track),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.backward_fill,
                              size: 50,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(CupertinoIcons.pause_fill, size: 50),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.forward_fill,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (track.isStopped) const Text('nothing playing'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _imageFrom(NowPlayingTrack track) {
    if (track.hasImage) {
      return Image(
        key: Key(track.id!),
        image: track.image!,
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      );
    }

    return const Text(
      'NO\nARTWORK\nFOUND',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, color: Colors.white),
    );
  }

  Widget _iconFrom(NowPlayingTrack track) {
    if (track.hasIcon) {
      return Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5)],
          shape: BoxShape.circle,
        ),
        child: Image(
          image: track.icon!,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
          color: _fgColorFor(track),
          colorBlendMode: BlendMode.srcIn,
        ),
      );
    }
    return Container();
  }

  Color _fgColorFor(NowPlayingTrack track) {
    switch (track.source) {
      case 'com.apple.music':
        return Colors.blue;
      case 'com.hughesmedia.big_finish':
        return Colors.red;
      case 'com.spotify.music':
        return Colors.green;
      default:
        return Colors.purpleAccent;
    }
  }
}

class TrackProgressIndicator extends StatefulWidget {
  const TrackProgressIndicator(this.track);
  final NowPlayingTrack track;

  @override
  _TrackProgressIndicatorState createState() => _TrackProgressIndicatorState();
}

class _TrackProgressIndicatorState extends State<TrackProgressIndicator> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = widget.track.progress.toString().split('.').first;
    final countdown = (widget.track.duration -
            widget.track.progress +
            const Duration(seconds: 1))
        .toString()
        .split('.')
        .first;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${progress.split(':').first}:${progress.split(':').last.padLeft(2, '0')}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
        ),
        Text(
          '-${int.parse(countdown.split(':')[1])}:${countdown.split(':').last.padLeft(2, '0')}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
        ),
      ],
    );
  }
}
