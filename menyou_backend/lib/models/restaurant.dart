import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant{
  final String id;
  final String name;
  final String city;
  final int stars;
  final String image;

  Restaurant({
    required this.id,
    required this.name,
    required this.city,
    required this.stars,
    required this.image
});

  factory Restaurant.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot){
    final data=documentSnapshot.data()!;
    return Restaurant(
      id:documentSnapshot.id,
      name:data['name'],
      city:data['city'],
      stars:data['stars'],
      image: data['image']
    );
  }

}