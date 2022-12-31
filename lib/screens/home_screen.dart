import 'package:flutter/material.dart';
import 'package:ipad_carplay/widgets/kakao_navi.dart';

import 'package:ipad_carplay/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: const [
                    SizedBox(
                      width: 900,
                      height: 740,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Kakaonavi(),
                        ),
                      ),
                    ),
                    // YoutubeMusic(),
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
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
