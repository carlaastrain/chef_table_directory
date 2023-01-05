import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/services/restaurant_service.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final restaurantService = GetIt.I<RestaurantService>();

  final String restaurantId;

  RestaurantDetailsScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: restaurantService.getRestaurant(restaurantId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.indigo[400],
                ),
                body: const Center(child: CircularProgressIndicator()));
          }

          final restaurant = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: Text(restaurant.restaurantName),
              backgroundColor: Colors.indigo[400],
            ),
            body: Text(restaurant.restaurantName),
          );
        });
  }
}
