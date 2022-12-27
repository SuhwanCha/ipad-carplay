import 'package:flutter/material.dart';
import 'package:ipad_carplay/widgets/map.dart';
import 'package:ipad_carplay/widgets/youtube_music.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(child: MapView()),
                YoutubeMusic(),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
          )
        ],
      ),
    );
  }
}
