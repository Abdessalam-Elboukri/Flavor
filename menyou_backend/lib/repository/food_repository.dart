import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Food.dart';


class FoodRepository {

  final _db = FirebaseFirestore.instance;

  Future<List<Food>> allFoods() async {
    final snapshot = await _db.collection("foods").get();
    final restaurantsData = snapshot.docs.map((e)=>Food.fromSnapshot(e)).toList();
    return  restaurantsData;
  }


  Future<List<Food>> getFoodsByResto(String restaurantId) async {
    final snapshot = await _db.collection("foods").where("restaurantId",isEqualTo: restaurantId).get();
    final foodsByRestoData = snapshot.docs.map((e)=>Food.fromSnapshot(e)).toList();
    return  foodsByRestoData;
  }


  Future<Food> getFoodDetails(String id) async {
    final snapshot = await _db.collection("foods").doc(id).get();
    return  Food(id: snapshot.id, name: snapshot.data()!['name'], image: snapshot.data()!['image'],
        description: snapshot.data()!['description'], price: snapshot.data()!['price'],
        category: snapshot.data()!['category'], restaurantId: snapshot.data()!['restaurantId']
    );
  }






}