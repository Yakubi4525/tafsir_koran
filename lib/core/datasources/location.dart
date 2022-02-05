import 'package:geolocator/geolocator.dart';

import 'cache_helper.dart';

class Location{
  String city;
  String country;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      city = '${place.locality}';
      country = '${place.country}';
      print('>>>>>>>>>>>>>>>><<<<<<<<<<<<<${CacheHelper.getData('country')}');
      print('>>>>>>>>>>>>>>>><<<<<<<<<<<<<${CacheHelper.getData('city')}');
      CacheHelper.saveData(key: 'country', value: '$country');
      CacheHelper.saveData(key: 'city', value: '$city');

    } catch (e) {
      print(e);
    }
  }


}