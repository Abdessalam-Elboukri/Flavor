import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Food.dart';

class LocalStorage {

  void saveData(String key, Food food) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(food.toJson()));
  }

  Future<Food?> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return Food(name: jsonMap['name'], id: jsonMap['id'], category: jsonMap['category'],
                  image: jsonMap['image'], price: jsonMap['price'], description: jsonMap['description'],
                  restaurantId: jsonMap['restaurantId']);
    } else {
      return null;
    }
  }



}