class Locationdata {
  final double lat;
  final double lon;

  Locationdata(this.lat, this.lon);

  static Locationdata locationItems(Map<String, double> location) {
    double lat = location['latitude'];
    double lon = location['longitude'];

    return Locationdata(lat, lon);
  }
}