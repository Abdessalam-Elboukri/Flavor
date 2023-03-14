import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/restaurant.dart';

class RestaurantRepository {

  final _db = FirebaseFirestore.instance;

  Future<List<Restaurant>> allRestaurants() async {
    final snapshot = await _db.collection("restaurants").get();
    final restaurantsData = snapshot.docs.map((e)=>Restaurant.fromSnapshot(e)).toList();
    return  restaurantsData;
  }
}