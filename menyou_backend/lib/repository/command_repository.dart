

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/models/command_items.dart';
import 'package:menyou_backend/utils/local_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/command.dart';

class CommandRepository {

  final _db = FirebaseFirestore.instance;
  final _localStorage = Get.put(LocalStorage());
  String _id=Uuid().v4();

  Future<void> createCommand() async{
    final commandItems = await _localStorage.readData();
    int totalPrice = 0;
    for (var item in commandItems) {
      totalPrice += item.price;
    }
    Command command = Command(id:_id, date:DateTime.now(), total_price:totalPrice, user_id:"user1");
    await _db.collection("commands").doc(_id).set({
      'user_id':command.user_id,
      'name':command.date,
      'total_price':command.total_price
    });
    fetchData();
    _localStorage.clear();
    _id=Uuid().v4();
  }

  void fetchData()  {
    _localStorage.readData().asStream().listen((events) {
      events.forEach((e) async {
        CommandItems data = CommandItems(
            price: e.price, quantity: e.quantity, foodId: e.id, commandId: _id);
        await InsertCommandItem(data);
      });
    });
  }


  
  Future<void> InsertCommandItem(CommandItems commandItems) async{
    await _db.collection("command_items").add({
        'price' : commandItems.price * commandItems.quantity,
        'quantity' : commandItems.quantity,
        'foodId' : commandItems.foodId,
        'commandId' : commandItems.commandId,
    });

  }



}