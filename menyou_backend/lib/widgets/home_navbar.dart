import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFF232227),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.fastfood,
            color: Colors.white,
            size: 30,
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFFEFB322),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 6,
                )
              ]
            ),
            child: Icon(
              Icons.restaurant,
              color: Colors.white,
              size: 35,

            ),
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.list,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
