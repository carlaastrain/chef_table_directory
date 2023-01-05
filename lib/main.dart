import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/custom_marker_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'services/restaurant_service.dart';
import './router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// instance of the RestaurantService
  final authService = AuthService();
  final restaurantService = RestaurantService();
  final markerService = await CustomMarkerService.init();
  GetIt.I.registerSingleton<AuthService>(authService);
  GetIt.I.registerSingleton<RestaurantService>(restaurantService);
  GetIt.I.registerSingleton<CustomMarkerService>(markerService);
}
// Singleton its a global instance of an object that can be accessed from anywhere in the app

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.indigo,
      ),
      routerConfig: router,
    );
  }
}
