import 'package:myweather/model/LocationData.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class LocationApi {

  Location _location = Location();
  String error;

  static LocationApi _instance;
  static LocationApi getInstance() => _instance ??= LocationApi();

  Future<Locationdata> getLocation() async {

    Map<String, double> location;

    try {
      location = (await _location.getLocation()) as Map<String, double>;
      error = null;
    } on PlatformException catch (e) {
      if(e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if(e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }
      location = null;
    }
    return Locationdata.locationItems(location);
  }
}
