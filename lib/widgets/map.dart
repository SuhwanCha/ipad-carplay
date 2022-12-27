import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      controller: NaverMapController(),
      options: NaverMapOptions(
        mapType: MapType.navi,
        nightModeEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.4980119172918, 127.02764082451965),
          zoom: 15,
          tilt: 60,
        ),
      ),
      pathOverlays: {
        PathOverlay(
          const PathOverlayId("1"),
          const [
            LatLng(37.4980119172918, 127.02764082451965),
            LatLng(37.51608328624442, 127.0195466856241),
          ],
          color: Colors.red,
          width: 25,
        ),
        PathOverlay(
          const PathOverlayId("2"),
          const [
            LatLng(37.51608328624442, 127.0195466856241),
            LatLng(37.5197657072878, 127.02813269829258),
          ],
          color: Colors.orange,
          width: 25,
        ),
        PathOverlay(
          const PathOverlayId("3"),
          const [
            LatLng(37.5197657072878, 127.02813269829258),
            LatLng(37.52450409394565, 127.02837844385417),
          ],
          color: Colors.green,
          width: 20,
        ),
      },
    );
  }
}
