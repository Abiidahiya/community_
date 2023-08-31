import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:community/view_model/usermap/map_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';



class MapWidget extends StatelessWidget {
  final MapController _mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      builder: (controller) => GoogleMap(
        onMapCreated: _mapController.onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0), // Default to center of the map
          zoom: 15,
        ),
    gestureRecognizers: Set()
    ..add(Factory<OneSequenceGestureRecognizer>(
    () => ScaleGestureRecognizer(),
      ),
    ))
    );}
}