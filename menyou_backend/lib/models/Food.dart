
import 'package:cloud_firestore/cloud_firestore.dart';

class Food{
  final String id;
  final String category;
  final String name;
  final String image;
  final int price;
  final String description;
  final String restaurantId;


  Food({ required this.id, required this.category, required this.name, required this.image, required this.price, required this.description, required this.restaurantId});


  factory Food.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot){
    final data=documentSnapshot.data()!;
    return Food(
        id:documentSnapshot.id,
        name:data['name'],
        price:data['price'],
        category:data['category'],
        description:data['description'],
        restaurantId:data['restaurantId'],
        image: data['image']
    );
  }

  Map<String, dynamic> toJson() {
    return {'id':id, 'name': name, 'image': image, 'category':category, 'price':price, 'description': description, 'restaurantId':restaurantId};
  }


}