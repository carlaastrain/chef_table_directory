import '../interfaces/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantService {
  Future<List<Restaurant>> getRestaurants() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("restaurantsData")
        .where("netflixShowName", isEqualTo: "Chef Table")
        .get();
    return querySnapshot.docs
        .map(
          (doc) => Restaurant.fromMap(
            id: doc.id,
            map: doc.data(),
          ),
        )
        .toList();
  }

  Future<List<Restaurant>> getPizzaRestaurants() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("restaurantsData")
        .where("netflixShowName", isEqualTo: "Chef Table Pizza")
        .get();
    return querySnapshot.docs
        .map(
          (doc) => Restaurant.fromMap(
            id: doc.id,
            map: doc.data(),
          ),
        )
        .toList();
  }

  Future<List<Restaurant>> getFranceRestaurants() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("restaurantsData")
        .where("netflixShowName", isEqualTo: "Chef Table France")
        .get();
    return querySnapshot.docs
        .map(
          (doc) => Restaurant.fromMap(
            id: doc.id,
            map: doc.data(),
          ),
        )
        .toList();
  }

  Future<List<Restaurant>> getAllRestaurants() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("restaurantsData").get();
    return querySnapshot.docs
        .map(
          (doc) => Restaurant.fromMap(
            id: doc.id,
            map: doc.data(),
          ),
        )
        .toList();
  }

  Future<Restaurant> getRestaurant(String id) async {
    final querySnapshot = await getAllRestaurants()
        .then((value) => value.firstWhere((element) => element.id == id));

    return querySnapshot;
  }
}
