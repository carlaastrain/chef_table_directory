class Restaurant {
  final String id;
  final String chefName;
  final String mainImage;
  final String restaurantName;
  final String netflixShowName;
  final int volume;
  final int chapter;
  final String city;
  final double lat;
  final double lng;
  final List<String> images;
  final String address;
  final String country;
  final String description;
  final String webPage;
  final String reservationsMail;
  final String contactPhone;
  final String reservations;

  Restaurant({
    required this.id,
    required this.chefName,
    required this.mainImage,
    required this.restaurantName,
    required this.netflixShowName,
    required this.volume,
    required this.chapter,
    required this.city,
    required this.lat,
    required this.lng,
    required this.images,
    required this.address,
    required this.country,
    required this.description,
    required this.webPage,
    required this.reservationsMail,
    required this.contactPhone,
    required this.reservations,
  });

  factory Restaurant.fromMap({
    required String id,
    required Map<String, dynamic> map,
  }) {
    return Restaurant(
      id: id,
      chefName: map['chefName'],
      mainImage: map['mainImage'],
      restaurantName: map['restaurantName'],
      netflixShowName: map['netflixShowName'],
      volume: map['volume'],
      chapter: map['chapter'],
      city: map['city'],
      lat: map['lat'],
      lng: map['lng'],
      images: List<String>.from(map['images']),
      address: map['address'],
      country: map['country'],
      description: map['description'],
      webPage: map['webPage'],
      reservationsMail: map['reservationsMail'],
      contactPhone: map['contactPhone'],
      reservations: map['reservations'],
    );
  }
}
