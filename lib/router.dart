import 'package:go_router/go_router.dart';
import 'package:my_app/screens/login_screen.dart';

import 'screens/tabs_screen.dart';
import 'screens/restaurant_details_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Tabs(),
  ),
  GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
  GoRoute(
    path: '/restaurants/:id',
    builder: (context, state) => RestaurantDetailsScreen(
      restaurantId: state.params['id']!,
    ),
  ),
]);
