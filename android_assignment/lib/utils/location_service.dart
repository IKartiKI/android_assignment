// lib/utils/location_service.dart

import 'package:geolocator/geolocator.dart';

class LocationService {
  // Check and request location permissions
  Future<bool> _handlePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  // Get current location (latitude and longitude)
  Future<Position?> getCurrentLocation() async {
    bool hasPermission = await _handlePermission();
    if (!hasPermission) return null;

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
