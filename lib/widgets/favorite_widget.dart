import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/exceptions/auth_exceptions.dart';

import '../services/auth_service.dart';
import '../services/favorite_service.dart';
import '../utils/app_styles.dart';
import '../interfaces/restaurant.dart';

class MyFavourite extends StatefulWidget {
  final Restaurant restaurant;
  final bool isFavorite;
  const MyFavourite(
      {super.key, required this.restaurant, required this.isFavorite});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  final authService = GetIt.I<AuthService>();
  final favoriteService = GetIt.I<FavoriteService>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: widget.isFavorite
            ? Icon(
                Icons.favorite,
                color: Styles.pink,
              )
            : Icon(
                Icons.favorite_border_outlined,
                color: Styles.pink,
              ),
        onPressed: () async {
          try {
            await favoriteService.toggleFavorite(widget.restaurant.id);
          } on NoUserException {
            GoRouter.of(context).go('/login');
          }
        });
  }
}
