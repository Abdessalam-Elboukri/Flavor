import 'package:cloud_firestore/cloud_firestore.dart';

class CommandItems{
  final String commandId;
  final String foodId;
  final int price;
  final int quantity;

  CommandItems({required this.commandId, required this.price,  required this.quantity, required this.foodId});

  CommandItems.fromJson(Map<String,dynamic> json):
        price=json['price'],
        foodId=json['foodId'],
        quantity= json['quantity'],
        commandId= json['commandId'];


  Map<String, dynamic> toJson() {
    return {'commandId': commandId, 'foodId': foodId, 'price':price,  'quantity': quantity};
  }


  factory CommandItems.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot){
    final data=documentSnapshot.data()!;
    return CommandItems(
        price:data['price'],
        foodId:data['foodId'],
        quantity:data['quantity'],
        commandId:data['commandId']
    );
  }
}