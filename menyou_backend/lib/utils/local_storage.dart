import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:menyou_backend/models/local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Food.dart';

class LocalStorage {


  final String key = 'cartList';

  Future<void> saveData(LocalFood command) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(command.toJson());
    final jsonList = prefs.getStringList(key) ?? [];
    jsonList.add(jsonString);
    await prefs.setStringList(key, jsonList);
    print(jsonList.length);
  }

  Future<List<LocalFood>> readData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(key) ?? [];
    final data= jsonList.map((jsonString) => LocalFood.fromJson(json.decode(jsonString))).toList();
    return data;
  }

  Future<void> clear()async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


}