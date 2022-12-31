import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 70,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).primaryColor.withOpacity(0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Container(
          width: 400,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.2),
          ),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
