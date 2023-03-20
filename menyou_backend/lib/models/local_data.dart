
import 'package:cloud_firestore/cloud_firestore.dart';

class LocalFood{
  final String id;
  final String category;
  final String name;
  final String image;
  final int price;
  final int quantity;


  LocalFood({ required this.id, required this.category, required this.name, required this.image, required this.price, required this.quantity});


  LocalFood.fromJson(Map<String,dynamic> json):
        id=json['id'],
        name=json['name'],
        price=json['price'],
        category=json['category'],
        quantity= json['quantity'],
        image= json['image'];


  Map<String, dynamic> toJson() {
    return {'id':id, 'name': name, 'image': image, 'category':category, 'price':price,  'quantity': quantity};
  }


}