import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipad_carplay/map_bloc/map_bloc.dart';
import 'package:kakaonavi/kakaonavi.dart';

class Kakaonavi extends StatelessWidget {
  const Kakaonavi({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NaviBloc>();

    return Stack(
      children: [
        Positioned.fill(
          child: KakaonaviView(
            bloc: bloc,
            onLocationUpdate: (p0) {
              context.read<MapBloc>().add(
                    MapUpdated(
                      remainDistance: p0.remainDistance,
                      remainTime: p0.remainTime,
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
