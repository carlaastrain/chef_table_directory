import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/widgets/restaurant_widget.dart';
import 'package:my_app/utils/app_styles.dart';
import 'package:my_app/widgets/double_text_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../services/restaurant_service.dart';

class MyHome extends StatelessWidget {
  final restaurantService = GetIt.I<RestaurantService>();

  MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Gap(40),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello foodies",
                                  style: Styles.headlineStyle3),
                              const Gap(5),
                              Text('Look for a table',
                                  style: Styles.headlineStyle1),
                            ]),
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/foodie.png"),
                            ),
                          ),
                        )
                      ]),
                  const Gap(40),
                ],
              ),
            ),
            const Gap(15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const AppDoubleTextWidget(
                bigText: "Chef's Tables",
                smallText: 'View all',
              ),
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20.0),
              child: FutureBuilder(
                  future: restaurantService.getRestaurants(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: snapshot.data!
                          .map((restaurantInfo) => GestureDetector(
                                child: RestaurantWidget(
                                    restaurant: restaurantInfo),
                                onTap: () => context
                                    .push("/restaurants/${restaurantInfo.id}"),
                              ))
                          .toList(),
                    );
                  }),
            ),
            const Gap(25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const AppDoubleTextWidget(
                bigText: "Chef's Tables Pizza",
                smallText: 'View all',
              ),
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20.0),
              child: FutureBuilder(
                  future: restaurantService.getPizzaRestaurants(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Row(
                        children: snapshot.data!
                            .map((restaurantInfo) => GestureDetector(
                                  child: RestaurantWidget(
                                      restaurant: restaurantInfo),
                                  onTap: () => context.push(
                                      "/restaurants/${restaurantInfo.id}"),
                                ))
                            .toList());
                  }),
            ),
            const Gap(25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const AppDoubleTextWidget(
                bigText: "Chef's Tables France",
                smallText: 'View all',
              ),
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20.0),
              child: FutureBuilder(
                  future: restaurantService.getFranceRestaurants(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Row(
                        children: snapshot.data!
                            .map((restaurantInfo) => GestureDetector(
                                  child: RestaurantWidget(
                                      restaurant: restaurantInfo),
                                  onTap: () => context.push(
                                      "/restaurants/${restaurantInfo.id}"),
                                ))
                            .toList());
                  }),
            ),
          ],
        ));
  }
}
