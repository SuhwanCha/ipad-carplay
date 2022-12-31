import 'package:proj4dart/proj4dart.dart';

class Coordinate {
  static Point toKatech(Point p) {
    final pointSrc = Point(x: p.x, y: p.y);

    // Use built-in projection
    final projSrc = Projection.get('EPSG:4326')!;

    // Find Projection by name or define it if not exists
    final projDst = Projection.get('KATEC') ??
        // ignore: lines_longer_than_80_chars
        Projection.add(
          'KATEC',
          '+proj=tmerc +lat_0=38 +lon_0=128 +k=0.9999 +x_0=400000 +y_0=600000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43',
        );

    // Forward transform (lonlat -> projected crs)
    final pointForward = projSrc.transform(projDst, pointSrc);
    return pointForward;
  }
}
