import 'package:rxdart/rxdart.dart';
import 'auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../exceptions/auth_exceptions.dart';

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
        .map((event) => List<String>.from(event.get("favorites")).toSet());
  }

  Future<void> toggleFavorite(String restaurantId) async {
    final user = await authService.currentUser().first;
    if (user == null) throw NoUserException("User is not logged in");
    final userDoc =
        await FirebaseFirestore.instance.collection("users").doc(user.id).get();
    List<String> favorites;
    try {
      favorites = List.from(userDoc.get("favorites"));
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
