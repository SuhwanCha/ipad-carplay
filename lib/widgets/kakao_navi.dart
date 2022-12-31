import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipad_carplay/map_bloc/map_bloc.dart';
import 'package:kakaonavi/kakaonavi.dart';

class Kakaonavi extends StatelessWidget {
  const Kakaonavi({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = NaviBloc();

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.white,
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
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ElevatedButton(
            onPressed: () {
              bloc.add(
                NaviGuideStarted(
                  name: '회사',
                  lng: 127.123456,
                  lat: 37.123456,
                  address: '서울특별시 강남구 테헤란로 427',
                ),
              );
            },
            child: const Text('Start'),
          ),
        ),
      ],
    );
  }
}
