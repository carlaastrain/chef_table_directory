import 'package:flutter/material.dart';
import '../interfaces/restaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurantInfo;
  const RestaurantDetailsScreen({super.key, required this.restaurantInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('hello'),
          backgroundColor: Colors.indigo[400],
        ),
        body: Text(restaurantInfo.restaurantName));
  }
}
