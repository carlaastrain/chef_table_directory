import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/services/restaurant_service.dart';
import 'package:my_app/utils/app_layout.dart';

import '../utils/app_styles.dart';
import '../widgets/details_row.dart';

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/${restaurant.mainImage}'),
                  ),
                ),
              ),
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.restaurant),
                        const Gap(20),
                        Text(
                          restaurant.description,
                          style: Styles.textStyle
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                  Container(
                    height: AppLayout.getHeight(160),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DetailsRow(
                          stringText: restaurant.address,
                          icon: Icon(
                            Icons.location_on,
                            color: Styles.blueMarine,
                          ),
                        ),
                        const Gap(20),
                        DetailsRow(
                          stringText: restaurant.chefName,
                          icon: Icon(
                            Icons.person,
                            color: Styles.blueMarine,
                          ),
                        ),
                        const Gap(20),
                        DetailsRow(
                          stringText: restaurant.webPage,
                          icon: Icon(
                            Icons.web,
                            color: Styles.blueMarine,
                          ),
                        ),
                        const Gap(20),
                        DetailsRow(
                          stringText: restaurant.reservations,
                          icon: Icon(
                            Icons.phone,
                            color: Styles.blueMarine,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
