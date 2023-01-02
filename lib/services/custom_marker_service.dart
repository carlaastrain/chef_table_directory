import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerService {
  static final paths = {
    'chef-solid': 'assets/images/asset7.png',
    'chef-outlined': 'assets/images/asset2.png',
    'pizza-solid': 'assets/images/asset8.png',
    'pizza-outlined': 'assets/images/asset3.png',
  };

  final Map<String, BitmapDescriptor> markers;

  CustomMarkerService({required this.markers});

  static Future<CustomMarkerService> init() async {
    final markers = <String, BitmapDescriptor>{};

    for (var entry in paths.entries) {
      markers[entry.key] = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        entry.value,
      );
    }

    return CustomMarkerService(markers: markers);
  }
}
