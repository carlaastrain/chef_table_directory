import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/widgets/double_text_widget.dart';
import 'package:get_it/get_it.dart';

import '../services/restaurant_service.dart';
import '../utils/app_styles.dart';
import '../widgets/box.dart';

class FavoritesScreen extends StatelessWidget {
  final restaurantService = GetIt.I<RestaurantService>();

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: FutureBuilder(
        future: restaurantService.getAllRestaurants(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              ListView(
                children: [
                  const Gap(45),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const AppDoubleTextWidget(
                      bigText: "All your favorites tables",
                      smallText: '',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 9.0, vertical: 12.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          children: snapshot.data!
                              .where((restaurantInfo) => false)
                              .map((restaurantInfo) => Box(
                                    restaurant: restaurantInfo,
                                  ))
                              .toList()),
                    ),
                  ),
                  const Gap(45),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const AppDoubleTextWidget(
                      bigText: "Add tables to your favorites",
                      smallText: '',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 9.0, vertical: 12.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          children: snapshot.data!
                              .where((restaurantInfo) => true)
                              .map(
                                (restaurantInfo) => GestureDetector(
                                  child: Box(
                                    restaurant: restaurantInfo,
                                  ),
                                  onTap: () => context.push(
                                      "/restaurants/${restaurantInfo.id}"),
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
