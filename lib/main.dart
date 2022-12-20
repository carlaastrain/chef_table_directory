import 'package:flutter/material.dart';
import 'package:my_app/screens/bottom_bar.dart';
import 'package:get_it/get_it.dart';

import 'services/restaurant_service.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  final restaurantService = RestaurantService();
  GetIt.I.registerSingleton<RestaurantService>(restaurantService);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.indigo,
      ),
      home: const BottomBar(),
    );
  }
}
