import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier {
  LocationData? _currentLocation;
  Marker? _currentLocationMarker;
  bool _isLocationEnabled = false;
  bool get isLocationEnabled => _isLocationEnabled;

  LocationData? get currentLocation => _currentLocation;
  Marker? get currentLocationMarker => _currentLocationMarker;

  Future<void> getCurrentLocation(BuildContext context) async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location service is disabled.")),
        );
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission is denied.")),
        );
        return;
      }
    }

    try {
      final LocationData locationData = await location.getLocation();
      _currentLocation = locationData;
      _currentLocationMarker = Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        infoWindow: const InfoWindow(title: 'You are here'),
      );

      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error getting location: $e")),
      );
    }
  }



  void toggleLocation(BuildContext context) async {
    if (_isLocationEnabled) {
      _isLocationEnabled = false;
      notifyListeners();
    } else {
      await getCurrentLocation(context);
      _isLocationEnabled = true;
      notifyListeners();
    }
  }

}
