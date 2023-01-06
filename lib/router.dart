import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/screens/favorites_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/logged_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/map_screen.dart';

import 'screens/tabs_screen.dart';
import 'screens/restaurant_details_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            Tabs(state: state, child: child),
        routes: [
          GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) => MyHome()),
          GoRoute(
              path: '/map',
              builder: (BuildContext context, GoRouterState state) =>
                  MapScreen()),
          GoRoute(
              path: '/favorites',
              builder: (BuildContext context, GoRouterState state) =>
                  FavoritesScreen()),
          GoRoute(
              path: '/login',
              builder: (BuildContext context, GoRouterState state) =>
                  const LoggedScreen()),
          GoRoute(
            path: '/restaurants/:id',
            builder: (BuildContext context, GoRouterState state) =>
                RestaurantDetailsScreen(
              restaurantId: state.params['id']!,
            ),
          ),
        ],
      ),
    ]);
