import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Position? _currentPosition;
  final NaverMapController _controller = NaverMapController();
  @override
  void initState() {
    super.initState();

    _determinePosition().then(
      (value) => setState(() {
        if (_controller.isInitialized) {
          _controller.moveCamera(
            options: CameraUpdateOptions(
              position: LatLng(value.latitude, value.longitude),
            ),
          );
        }
        _currentPosition = value;
      }),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      controller: _controller,
      options: NaverMapOptions(
        mapType: MapType.navi,
        initLocationTrackingMode: LocationTrackingMode.follow,
        nightModeEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _currentPosition == null
              ? const LatLng(37.4980119172918, 127.02764082451965)
              : LatLng(
                  _currentPosition!.latitude,
                  _currentPosition!.longitude,
                ),
          tilt: 60,
        ),
      ),
    );
  }
}
