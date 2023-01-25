import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/interfaces/restaurant.dart';
import 'package:my_app/screens/restaurant_details_screen.dart';

import 'package:my_app/widgets/box.dart';

import 'package:get_it/get_it.dart';
import '../services/custom_marker_service.dart';
import '../services/favorite_service.dart';
import '../services/restaurant_service.dart';
import '../utils/app_styles.dart';
import '../utils/directions_model.dart';

class MapScreen extends StatelessWidget {
  final restaurantService = GetIt.I<RestaurantService>();

  MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: restaurantService.getAllRestaurants(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Map(
          restaurants: snapshot.data!,
        );
      },
    );
  }
}

class Map extends StatefulWidget {
  final List<Restaurant> restaurants;

  const Map({
    super.key,
    required this.restaurants,
  });

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final customMarkerService = GetIt.I<CustomMarkerService>();
  final favoriteService = GetIt.I<FavoriteService>();

  _MapState() {
    pageController.addListener(pageControllerListener);
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.250652, -39.054810),
    zoom: 0,
  );

  int? selectedIndex;
  bool animating = false;

  GoogleMapController? _googleMapController;

  final pageController = PageController(viewportFraction: 0.8);
  // Marker? _origin;
  // Marker? _destination;
  Directions? _info;

  @override
  void dispose() {
    _googleMapController?.dispose();
    pageController.removeListener(pageControllerListener);
    super.dispose();
  }

  void pageControllerListener() {
    if (pageController.hasClients) {
      final newIndex = pageController.page!.round();

      if (newIndex != selectedIndex && !animating) {
        setState(() {
          selectedIndex = newIndex;
        });
        final restaurant = widget.restaurants[newIndex];

        _googleMapController?.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(
              restaurant.lat,
              restaurant.lng,
            ),
          ),
        );
      }
    }
  }

  BitmapDescriptor getIcon(
    Restaurant restaurant,
    bool isSelected,
  ) {
    if (isSelected && restaurant.netflixShowName == "Chef Table Pizza") {
      return customMarkerService.markers['pizza-outlined']!;
    }

    if (isSelected && restaurant.netflixShowName == "Chef Table") {
      return customMarkerService.markers['chef-outlined']!;
    }

    if (isSelected && restaurant.netflixShowName == "Chef Table France") {
      return customMarkerService.markers['france-outlined']!;
    }
    return restaurant.netflixShowName == "Chef Table"
        ? customMarkerService.markers['chef-solid']!
        : restaurant.netflixShowName == "Chef Table Pizza"
            ? customMarkerService.markers['pizza-solid']!
            : restaurant.netflixShowName == "Chef Table France"
                ? customMarkerService.markers['france-solid']!
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet);
  }

  Set<Marker> createMarkers(
    List<Restaurant> restaurants,
  ) {
    return restaurants
        .asMap()
        .entries
        .map(
          (entry) => Marker(
            markerId: MarkerId(entry.value.restaurantName),
            position: LatLng(entry.value.lat, entry.value.lng),
            icon: getIcon(entry.value, entry.key == selectedIndex),
            onTap: () async {
              setState(() {
                selectedIndex = entry.key;
                animating = true;
              });

              await pageController.animateToPage(
                entry.key,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );

              setState(() {
                animating = false;
              });
            },
          ),
        )
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("GREAT CHEF'S MAP"),
        backgroundColor: Styles.blueMarine,
        actions: [
          TextButton(
            onPressed: () =>
                _googleMapController?.animateCamera(CameraUpdate.zoomOut()),
            child: Icon(
              Icons.zoom_out,
              color: Styles.iconColor,
              size: 34,
            ),
          ),
          TextButton(
            onPressed: () =>
                _googleMapController?.animateCamera(CameraUpdate.zoomIn()),
            child: Icon(
              Icons.zoom_in,
              color: Styles.pink,
              size: 34,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onMapCreated: (controller) => _googleMapController = controller,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            markers: createMarkers(widget.restaurants),
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Styles.blueMarine,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((event) => LatLng(event.latitude, event.longitude))
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
                children: widget.restaurants
                    .map(
                      (restaurantInfo) => GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantDetailsScreen(
                                      restaurantId: restaurantInfo.id,
                                    )),
                          ),
                        },
                        child: StreamBuilder<Set<String>>(
                            initialData: const {},
                            stream: favoriteService.favorites(),
                            builder: (context, favoriteSnapshot) {
                              return Box(
                                restaurant: restaurantInfo,
                                isFavorite: favoriteSnapshot.data!
                                    .contains(restaurantInfo.id),
                              );
                            }),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
