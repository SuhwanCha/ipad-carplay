import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmap_models/flutter_tmap_models.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakaonavi/kakaonavi.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  Timer? _debounce;
  final TextEditingController _controller = TextEditingController();
  List<Poi> _pois = [];
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      final location = await Geolocator.getLastKnownPosition();
      final pois = (await PoiRequest.send(
        searchKeyword: query,
        centerLon: location?.longitude ?? 0,
        centerLat: location?.latitude ?? 0,
        appKey: 'l7xxea76f8cc0a394708aeb91dd920e6af6b',
      ))
          .pois;
      setState(() {
        _pois = pois;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 70,
          child: TextField(
            controller: _controller,
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
            onChanged: _onSearchChanged,
          ),
        ),
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            itemCount: _pois.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  final bloc = context.read<NaviBloc>();
                  final location = await Geolocator.getCurrentPosition();

                  bloc.add(
                    NaviGuideStarted(
                      name: _pois[index].name!,
                      lng: double.parse(_pois[index].frontLon!),
                      lat: double.parse(_pois[index].frontLat!),
                      address: _pois[index].roadName!,
                      startLat: location.latitude,
                      startLng: location.longitude,
                    ),
                  );

                  // ignore: inference_failure_on_instance_creation
                  await Future.delayed(const Duration(milliseconds: 200));

                  bloc.add(
                    NaviGuideStarted(
                      name: _pois[index].name!,
                      lng: double.parse(_pois[index].frontLon!),
                      lat: double.parse(_pois[index].frontLat!),
                      address: _pois[index].roadName!,
                      startLat: location.latitude,
                      startLng: location.longitude,
                    ),
                  );

                  _controller.value = TextEditingValue.empty;
                  FocusScope.of(context).requestFocus(FocusNode());

                  setState(() {
                    _pois = [];
                  });
                },
                child: ListTile(
                  title: Text(_pois[index].name!),
                  subtitle: Text(_pois[index].roadName!),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
