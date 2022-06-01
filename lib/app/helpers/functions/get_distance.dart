  import 'dart:math';

double distance(lat1, lon1, lat2, lon2) {
    lon1 = lon1 * pi / 180;
    lon2 = lon2 * pi / 180;
    lat1 = lat1 * pi / 180;
    lat2 = lat2 * pi / 180;
    final int dlon = lon2 - lon1;
    final int dlat = lat2 - lat1;
    final a = pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
    final c = 2 * sin(sqrt(a));
    const r = 6371;
    return (c * r);
  }