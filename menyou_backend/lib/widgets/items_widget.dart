import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/food_controller.dart';
import '../models/Food.dart';
import '../pages/single_item_page.dart';


class ItemsWidget extends StatelessWidget {
  final String restaurant_id;
  const ItemsWidget({super.key, required this.restaurant_id});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("<<<<<<<<<<<<<<<>>${restaurant_id}");
    final controller = Get.put(FoodController());
    return FutureBuilder<List<Food>>(
        future: controller.getFoodsByResto(restaurant_id),
      builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.none){
        return Text("error connect");
      }else if(snapshot.hasError){
        return Text("${snapshot.error}");
      }
      else{
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.75,
          children:
            List.generate(snapshot.data!.length,(index){
              return Container(
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
                ElevatedButton(
                  onPressed: () async {
                    var food_id = snapshot.data![index].id;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleItemPage(food_id: food_id),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Image.network(snapshot.data![index].image,
                      width:double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),

                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${snapshot.data![index].name}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),

                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${snapshot.data![index].category}",
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
                        "\$ ${snapshot.data![index].price}",
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
              );
          }
        ),
      );
      }
      }
    );
  }
}