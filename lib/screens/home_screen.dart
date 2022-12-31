import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipad_carplay/map_bloc/map_bloc.dart';
import 'package:ipad_carplay/screens/now_playing_widget.dart';
import 'package:ipad_carplay/widgets/kakao_navi.dart';
import 'package:ipad_carplay/widgets/search.dart';
import 'package:nowplaying/nowplaying.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NowPlaying.instance.start(resolveImages: true);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 850,
                      height: 740,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Kakaonavi(),
                        ),
                      ),
                    ),
                    Expanded(
                      // child: YoutubeMusic(),
                      child: SizedBox(
                        height: double.infinity,
                        child: NowPlayingWidget(),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return Container(
                    height: 100,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.12),
                    child: Row(
                      children: [
                        const SizedBox(width: 32),
                        Text(
                          '${state.remainTime ~/ 60}m ${state.remainTime % 60}s',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(width: 30),
                        Text(
                          '${state.remainDistance / 1000}km',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          const Positioned(
            top: 32,
            left: 32,
            child: SearchWidget(),
          ),
        ],
      ),
    );
  }
}
