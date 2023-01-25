import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/widgets/double_text_widget.dart';
import 'package:get_it/get_it.dart';

import '../services/favorite_service.dart';
import '../services/restaurant_service.dart';
import '../utils/app_styles.dart';
import '../widgets/box.dart';

class FavoritesScreen extends StatelessWidget {
  final restaurantService = GetIt.I<RestaurantService>();
  final favoriteService = GetIt.I<FavoriteService>();

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
              StreamBuilder<Set<String>>(
                  initialData: const {},
                  stream: favoriteService.favorites(),
                  builder: (context, favoriteSnapshot) {
                    return ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          margin: EdgeInsets.only(
                            top: (favoriteSnapshot.data != null &&
                                    favoriteSnapshot.data!.isNotEmpty)
                                ? 40
                                : 0,
                          ),
                          child: (favoriteSnapshot.data != null &&
                                  favoriteSnapshot.data!.isNotEmpty)
                              ? const AppDoubleTextWidget(
                                  bigText: "All your favorites tables",
                                  smallText: '',
                                )
                              : null,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          margin: EdgeInsets.only(
                            bottom: (favoriteSnapshot.data != null &&
                                    favoriteSnapshot.data!.isNotEmpty)
                                ? 20
                                : 0,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                children: snapshot.data!
                                    .where((restaurantInfo) => favoriteSnapshot
                                        .data!
                                        .contains(restaurantInfo.id))
                                    .map((restaurantInfo) => Box(
                                        restaurant: restaurantInfo,
                                        isFavorite: favoriteSnapshot.data!
                                            .contains(restaurantInfo.id)))
                                    .toList()),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          margin: EdgeInsets.only(
                              top: (favoriteSnapshot.data != null &&
                                      favoriteSnapshot.data!.isNotEmpty)
                                  ? 0
                                  : 40),
                          child: const AppDoubleTextWidget(
                            bigText: "Add tables to your favorites",
                            smallText: '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  children: snapshot.data!
                                      .where(
                                        (restaurantInfo) => !favoriteSnapshot
                                            .data!
                                            .contains(restaurantInfo.id),
                                      )
                                      .map(
                                        (restaurantInfo) => GestureDetector(
                                          child: Box(
                                            restaurant: restaurantInfo,
                                            isFavorite: favoriteSnapshot.data!
                                                .contains(restaurantInfo.id),
                                          ),
                                          onTap: () => context.push(
                                              "/restaurants/${restaurantInfo.id}"),
                                        ),
                                      )
                                      .toList())),
                        ),
                      ],
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
