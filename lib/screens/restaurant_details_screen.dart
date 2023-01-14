import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/services/restaurant_service.dart';

import '../utils/app_styles.dart';

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
            body: Column(
              children: [
                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/${restaurant.mainImage}'),
                    ),
                  ),
                ),
                const Gap(20),
                const Icon(Icons.restaurant),
                const Gap(20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    restaurant.description,
                    style: Styles.textStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(5),
              ],
            ),
          );
        });
  }
}
