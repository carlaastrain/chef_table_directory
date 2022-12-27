import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerService {
  static final paths = {
    'pizza': 'assets/images/pizza.png',
    'pizza-color': 'assets/images/pizza_color.png',
    'pizza-black-and-white': 'assets/images/pizza_black_and_white.png',
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
