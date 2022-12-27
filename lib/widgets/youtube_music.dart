import 'dart:ui';

import 'package:flutter/material.dart';

class YoutubeMusic extends StatelessWidget {
  const YoutubeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/XbfeZvJWWdz3-Pmgihrfdho-P7T_h9XMv9RqMyTCqoetrDfNQnOOlmP8eFrN3-FfbJ2aNwGdK3Am12Iy=w544-h544-s-l90-rj'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.0)),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://lh3.googleusercontent.com/XbfeZvJWWdz3-Pmgihrfdho-P7T_h9XMv9RqMyTCqoetrDfNQnOOlmP8eFrN3-FfbJ2aNwGdK3Am12Iy=w544-h544-s-l90-rj',
                  width: 300,
                ),
                const SizedBox(height: 20),
                Text(
                  "Beethoven: Piano Concerto No. 5 in E-Flat Major, Op. 73 \"Emperor\" - 1. Allegro (Live)",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  "Krystian Zimerman • Beethoven: Piano Concerto No.5 • 1989",
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.skip_previous, size: 50),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pause, size: 50),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.skip_next, size: 50),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
