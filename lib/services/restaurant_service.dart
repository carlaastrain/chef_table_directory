import '../interfaces/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantService {
  Future<List<Restaurant>> getRestaurants() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("restaurantsData").get();
    return querySnapshot.docs
        .map((doc) => Restaurant.fromMap(doc.data()))
        .toList();
  }

  Future<List<Restaurant>> getPizzaRestaurants() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("restaurantsPizzaData")
        .get();
    return querySnapshot.docs
        .map((doc) => Restaurant.fromMap(doc.data()))
        .toList();
  }

  Future<List<Restaurant>> getAllRestaurants() async {
    final querySnapshot = [
      ...await getRestaurants(),
      ...await getPizzaRestaurants()
    ];
    return querySnapshot;
  }
}
