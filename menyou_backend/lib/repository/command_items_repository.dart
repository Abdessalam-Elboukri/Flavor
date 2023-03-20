


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:menyou_backend/models/command_items.dart';

class CommandItemsRepository extends GetxController{

  final _db = FirebaseFirestore.instance;

  Future<List<CommandItems>> getAllitems() async {
    final snapshot = await _db.collection("command_items").get();
    final items = snapshot.docs.map((e)=>CommandItems.fromSnapshot(e)).toList();
    return items;
  }
}