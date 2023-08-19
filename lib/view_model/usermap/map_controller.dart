import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';



class MapController extends GetxController {
  final Rx<GoogleMapController?> _mapController = Rx<GoogleMapController?>(null);
  final Rx<LocationData?> _locationData = Rx<LocationData?>(null);

  GoogleMapController? get mapController => _mapController.value;
  LocationData? get locationData => _locationData.value;

  @override
  void onInit() {
    super.onInit();
    _initLocationService();
  }

  @override
  void onClose() {
    _mapController.value?.dispose();
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController.value = controller;
  }

  void _initLocationService() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw 'Location service is disabled.';
      }
    }

    // Check if location permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw 'Location permission is denied.';
      }
    }

    // Get the user's location
    try {
      final userLocation = await location.getLocation();
      _locationData.value = userLocation;
      _updateCameraPosition();
    } catch (e) {
      print('Failed to get location: $e');
    }
  }

  void _updateCameraPosition() {
    final LatLng? userLatLng = locationData != null
        ? LatLng(locationData!.latitude!, locationData!.longitude!)
        : null;

    if (userLatLng != null && mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(userLatLng));
    }
  }
}