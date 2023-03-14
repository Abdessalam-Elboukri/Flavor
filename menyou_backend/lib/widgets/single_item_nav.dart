import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SingleItemNavBar extends StatelessWidget {
  final int price;
  const SingleItemNavBar({super.key, required this.price});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return Container(
    height: 80,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Total Price",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 10,),
            Text("\$ ${price}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            decoration: const BoxDecoration(
                color: Color(0xFFEFB322),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight:Radius.circular(20),
                  bottomLeft:Radius.circular(20),
                )
            ),
            child: Row(
              children: const [
                Text("Order Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(width: 10,),
                Icon(CupertinoIcons.shopping_cart,color: Colors.white,size: 30),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }
}