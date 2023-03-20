import 'package:flutter/material.dart';
import 'package:menyou_backend/widgets/home_navbar.dart';

import '../widgets/items_widget.dart';


class HomePage extends StatelessWidget {

  final String restaurant_id;
  const HomePage({super.key, required this.restaurant_id});

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
              child: Text("hot & Fast Food", style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
              ),
              ),
              SizedBox(height: 5),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Delivered On Time", style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                ),
                ),
              ),
          SizedBox(height: 30),
              TabBar(
                isScrollable: true,
                indicator: BoxDecoration(),
                labelStyle: TextStyle(fontSize: 20),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(text: "Burger"),
                  Tab(text: "Pizza"),
                  Tab(text: "Cheese"),
                  Tab(text: "Pasta"),
                ],
              ),
               Flexible(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      ItemsWidget(restaurant_id: restaurant_id,),
                      ItemsWidget(restaurant_id: restaurant_id,),
                      ItemsWidget(restaurant_id: restaurant_id,),
                      ItemsWidget(restaurant_id: restaurant_id,),
                    ],
                  )
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
