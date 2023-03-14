import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/utils/local_storage.dart';

import '../controller/food_controller.dart';
import '../models/Food.dart';
import '../widgets/single_item_nav.dart';


class SingleItemPage extends StatefulWidget {
  final String food_id;
  const SingleItemPage({super.key, required this.food_id,});

  @override
  _SingleItemPage createState() => _SingleItemPage();

}

class _SingleItemPage extends State<SingleItemPage>{

  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter>1){
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    final localStorage= Get.put(LocalStorage());
    return FutureBuilder<Food>(
        future: controller.getfoodDetails(widget.food_id),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Text("error connect");
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          else {
            Food foodData = snapshot.data!;
              return Scaffold(
                backgroundColor: Color(0xFF232227),
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, left: 15, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Image.network(foodData.image,
                              width: double.infinity,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 2.5,
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(right: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text("${foodData.name}", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _decrementCounter();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                5),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.minus,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                       Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                              "${_counter}",
                                              style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _incrementCounter();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                5),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.plus,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                                "${foodData.description}",
                                style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar:
                     Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text("Total Price",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text("\$ ${foodData.price}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Food food = Food(id:foodData.id,
                                    category: foodData.category,
                                    name: foodData.name,
                                    image: foodData.image,
                                    price: foodData.price,
                                    description: foodData.description,
                                    restaurantId: foodData.restaurantId);
                                localStorage.saveData("1", food);
                              },
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
                     ),
                  );
                }
            }
          );
      }
  }