import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/pages/home_page.dart';

import '../controller/restaurant_controller.dart';
import '../models/restaurant.dart';


class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(RestaurantController());
    int i;
    int itemCount;
    return FutureBuilder<List<Restaurant>>(
        future: controller.getAllRestaurants(),
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
              childAspectRatio: 0.9,
              children:
                 List.generate(snapshot.data?.length ?? 0, (index){
                   if (snapshot.data == null) return Container();
                      return Container(
                        padding: EdgeInsets.symmetric(vertical:5, horizontal:5),
                        margin: EdgeInsets.symmetric(vertical:5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                            color: Color(0xFF232227),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius:1,
                                blurRadius: 8,
                              )
                            ],
                        ),
                        child: Column(children: [
                          GestureDetector(
                            onTap: () {
                              var restaurant_id = snapshot.data![index].id;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(restaurant_id: restaurant_id),
                                ),
                              );
                            },
                            child: Container(
                              //margin: EdgeInsets.all(5),
                              child: Image.network(
                                snapshot.data![index].image,
                                width: 200,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
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
                            padding: EdgeInsets.only(bottom: 8),

                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${snapshot.data![index].city}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white24,
                                ),
                              ),
                            ),

                          ),
                          Padding(
                            padding:EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${snapshot.data![index].stars}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                for(i=0;i<snapshot.data![index].stars.toInt();i++)
                                  Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                              ],
                            ),
                          )
                        ],),
                      );
                  },
                ),
            );
              }
            }
    );
  }
}