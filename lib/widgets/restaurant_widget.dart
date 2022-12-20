import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

import '../interfaces/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(380),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.blueMarine,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/${restaurant.mainImage}",
                ),
              ),
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.restaurantName,
                style:
                    Styles.headlineStyle2.copyWith(color: Colors.grey.shade200),
              ),
              const Gap(5),
              Text(
                '${restaurant.city}, ${restaurant.country}',
                style: Styles.headlineStyle3.copyWith(color: Styles.pink),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                restaurant.description,
                style: Styles.textStyle.copyWith(
                  color: Colors.grey.shade200,
                  fontSize: 12,
                ),
              ),
              const Gap(5),
            ],
          ),
        ],
      ),
    );
  }
}
