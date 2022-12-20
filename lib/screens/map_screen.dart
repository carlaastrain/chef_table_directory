import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/screens/restaurant_details_screen.dart';

import 'package:my_app/widgets/box.dart';

import 'package:get_it/get_it.dart';
import '../services/restaurant_service.dart';
import '../utils/app_styles.dart';
import '../utils/directions_model.dart';
// import '../utils/directions_repository.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final restaurantService = GetIt.I<RestaurantService>();
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.250652, -39.054810),
    zoom: 0,
  );
  Set<Marker> markers = <Marker>{};
  double currentLat = 30.250652;
  double currentLng = -39.054810;
  double currentZoom = 1.00;

  GoogleMapController? _googleMapController;
  final pageController = PageController(viewportFraction: 0.8);
  // Marker? _origin;
  // Marker? _destination;
  Directions? _info;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("CHEFS MAP"),
        backgroundColor: Styles.blueMarine,
        actions: [
          TextButton(
            onPressed: () => {_zoomOut(currentLat, currentLng, 2)},
            child: Icon(
              Icons.zoom_out,
              color: Styles.iconColor,
              size: 34,
            ),
          ),
          TextButton(
            onPressed: () => {_zoomIn(currentLat, currentLng, 2)},
            child: Icon(
              Icons.zoom_in,
              color: Styles.pink,
              size: 34,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: restaurantService.getAllRestaurants(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          markers = snapshot.data!
              .asMap()
              .entries
              .map(
                (entry) => Marker(
                  markerId: MarkerId(entry.value.restaurantName),
                  position: LatLng(entry.value.lat, entry.value.lng),
                  infoWindow: InfoWindow(
                    title: entry.value.restaurantName,
                    snippet: entry.value.address,
                  ),
                  icon: entry.value.netflixShowName == "Chef Table Pizza"
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueCyan)
                      : BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueViolet),
                  onTap: () {
                    pageController.animateToPage(
                      entry.key,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              )
              .toSet();
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GoogleMap(
                onMapCreated: (controller) => _googleMapController = controller,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,
                initialCameraPosition: _initialCameraPosition,
                markers: Set<Marker>.of(markers),
                polylines: {
                  if (_info != null)
                    Polyline(
                      polylineId: const PolylineId('overview_polyline'),
                      color: Styles.blueMarine,
                      width: 5,
                      points: _info!.polylinePoints
                          .map((event) =>
                              LatLng(event.latitude, event.longitude))
                          .toList(),
                    ),
                },
              ),
              if (_info?.totalDistance != null)
                Positioned(
                  top: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Styles.pink,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: Text(
                      '${_info?.totalDistance}, ${_info?.totalDuration}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              Positioned(
                child: SizedBox(
                  height: 200,
                  child: PageView(
                    controller: pageController,
                    children: snapshot.data!
                        .map(
                          (restaurantInfo) => GestureDetector(
                            onTap: () => {
                              currentLat = restaurantInfo.lat,
                              currentLng = restaurantInfo.lng,
                              currentZoom = 15,
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RestaurantDetailsScreen(
                                          restaurantInfo: restaurantInfo,
                                        )),
                              ),
                            },
                            // onLongPress: () => {
                            //   markers.union({
                            //     Marker(
                            //       markerId:
                            //           MarkerId(restaurantInfo.restaurantName),
                            //       infoWindow: const InfoWindow(title: 'Origin'),
                            //       icon: BitmapDescriptor.defaultMarkerWithHue(
                            //           BitmapDescriptor.hueRed),
                            //       position: LatLng(currentLat, currentLng),
                            //     )
                            //   }),
                            //   setState(() => markers),
                            // },
                            child: Box(
                              restaurant: restaurantInfo,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // void _addMarker(LatLng position) async {
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: position,
  //       );
  //       _destination = null;
  //       _info = null;
  //     });
  //   } else {
  //     setState(() {
  //       _destination = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //         position: position,
  //       );
  //     });
  //   }
  // }

  //     // Get directions
  //     final directions = await DirectionsRepository().getDirections(
  //         origin: _origin!.position, destination: _destination!.position);
  //     setState(() => {_info = directions});
  //   }
  // }

  Future<void> _zoomOut(double lat, double lng, double zoomValue) async {
    _googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: currentZoom - zoomValue,
        ),
      ),
    );
    currentZoom - zoomValue < 1
        ? currentZoom = 1
        : currentZoom = currentZoom - zoomValue;
  }

  Future<void> _zoomIn(double lat, double lng, double zoomValue) async {
    _googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: currentZoom + zoomValue,
        ),
      ),
    );

    currentZoom = currentZoom + zoomValue;
  }
}
