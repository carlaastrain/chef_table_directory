import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../interfaces/restaurant.dart';

class MyFavourite extends StatefulWidget {
  final Restaurant restaurant;
  const MyFavourite({super.key, required this.restaurant});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.favorite_border_outlined,
          color: Styles.pink,
        ),
        onPressed: () {
          _toggleFavorite();
        });
  }

  void _toggleFavorite() {
    setState(() {
      // ignore: todo
      ///TODO toggle
    });
  }
}
