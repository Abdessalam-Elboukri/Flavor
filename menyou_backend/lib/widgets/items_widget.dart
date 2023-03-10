import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.78,
      children: [
        for(int i=1;i<5;i++)
        Container(
          padding: EdgeInsets.symmetric(vertical:5, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical:5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFF232227),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius:1,
                blurRadius: 8,
              )
            ]
          ),
        child: Column(children: [
          InkWell(
            onTap:(){
              Navigator.pushNamed(context, "singleItemPage");
          },
            child: Container(
              margin: EdgeInsets.all(5),
              child: Image.network("https://www.transparentpng.com/download/food/740sAx-burger-food-hd-pic.png",
                width:220,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),

            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hot Burger",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),

            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Fast Food",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white24,
                ),
              ),
            ),

          ),
          Padding(
            padding:EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$55",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(CupertinoIcons.cart_badge_plus,size: 27,color: Colors.white,)
              ],
            ),

          )
        ],),
        )
      ],
    );
  }
}