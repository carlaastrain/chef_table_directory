import 'package:rxdart/rxdart.dart';
import 'auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteService {
  final AuthService authService;

  FavoriteService({required this.authService});

  Stream<Set<String>> favorites() {
    return authService.currentUser().flatMap((user) {
      if (user == null) {
        return Stream.value({});
      } else {
        return _favoritesForUser(user.id);
      }
    });
  }

  Stream<Set<String>> _favoritesForUser(String userId) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((event) => (event.get("favorites") as List<String>).toSet());
  }

  Future<void> toggleFavorite(String userId, String restaurantId) async {
    final userDoc =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();
    List<String> favorites;
    try {
      favorites = userDoc.get("favorites") as List<String>;
    } catch (e) {
      favorites = [];
    }
    if (favorites.contains(restaurantId)) {
      favorites.remove(restaurantId);
    } else {
      favorites.add(restaurantId);
    }
    await userDoc.reference.set({"favorites": favorites});
  }
}