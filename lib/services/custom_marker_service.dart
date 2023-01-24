import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class CustomMarkerService {
  static final paths = {
    'chef-solid': 'assets/images/asset7.png',
    'chef-outlined': 'assets/images/asset2.png',
    'pizza-solid': 'assets/images/asset8.png',
    'pizza-outlined': 'assets/images/asset3.png',
    'france-solid': 'assets/images/asset9.png',
    'france-outlined': 'assets/images/asset10.png',
  };

  final Map<String, BitmapDescriptor> markers;

  CustomMarkerService({required this.markers});

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<CustomMarkerService> init() async {
    final markers = <String, BitmapDescriptor>{};

    for (var entry in paths.entries) {
      if (Platform.isAndroid) {
        final Uint8List markerIcon = await getBytesFromAsset(entry.value, 100);
        markers[entry.key] = BitmapDescriptor.fromBytes(markerIcon);
      } else {
        markers[entry.key] = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          entry.value,
          mipmaps: false,
        );
      }
    }

    return CustomMarkerService(markers: markers);
  }
}
