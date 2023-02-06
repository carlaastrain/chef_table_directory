import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/screens/favorites_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import './utils/go_router-refresh_stream.dart';

import 'package:my_app/screens/map_screen.dart';
import 'package:my_app/screens/log_in_screen.dart';
import 'package:my_app/screens/loggedin_screen.dart';
import './services/auth_service.dart';

import 'screens/tabs_screen.dart';
import 'screens/restaurant_details_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter createRouter(AuthService authService) {
  return GoRouter(
      refreshListenable: GoRouterRefreshStream(authService.currentUser),
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
                builder: (BuildContext context, GoRouterState state) =>
                    MyHome()),
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
                  const LogInScreen(),
              redirect: (context, state) async {
                final user = await authService.currentUser.first;
                if (user != null) {
                  return '/loggedin';
                } else {
                  return null;
                }
              },
            ),
            GoRoute(
              path: '/loggedin',
              builder: (BuildContext context, GoRouterState state) =>
                  const LoggedInScreen(),
              redirect: (context, state) async {
                final user = await authService.currentUser.first;
                if (user == null) {
                  return '/login';
                } else {
                  return null;
                }
              },
            ),
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
}
