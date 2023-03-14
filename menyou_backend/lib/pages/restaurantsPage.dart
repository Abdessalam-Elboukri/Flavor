import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menyou_backend/widgets/home_navbar.dart';

import '../widgets/items_widget.dart';
import '../widgets/restaurant_widget.dart';


class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      child : Scaffold(
        backgroundColor: Color(0xFF232227),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top:25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){},
                          child:const Icon(
                            Icons.sort_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Our Restaurants", style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  SizedBox(height: 5),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Best Food Ever", style: TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: RestaurantWidget(),
                  )
                ],
              )
          ),
        ),
        bottomNavigationBar: HomeNavBar(),
      ),
    );
  }
}
