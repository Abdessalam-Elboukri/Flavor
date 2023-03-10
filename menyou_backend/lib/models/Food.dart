
import 'package:flutter/cupertino.dart';

class Food{
  final String id;
  final String category;
  final String name;
  final String image;
  final String restaurantId;


  Food({ required this.id, required this.category, required this.name, required this.image, required this.restaurantId});

  factory Food.fromJson(Map<String,dynamic> json)=> Food(
    id:json['id'],
    category:json['category'],
    name:json['name'],
    image:json['image'],
    restaurantId:json['restaurantId']
  );


}