import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menyou_backend/pages/cart_page.dart';
import 'package:menyou_backend/pages/command_list_page.dart';
import 'package:menyou_backend/pages/home_page.dart';
import 'package:menyou_backend/pages/restaurantsPage.dart';
import 'package:menyou_backend/pages/single_item_page.dart';
import 'package:menyou_backend/pages/start_page.dart';

import 'models/Food.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),
      routes: {
        "/" :(context) => StartPage(),
        "Home" :(context) => HomePage(restaurant_id: '',),
        "RestaurantsPage" : (context) => RestaurantsPage(),
        "SingleItemPage":(context) => SingleItemPage(food_id: '',),
        "CartPage" : (context) => CartPage(),
        "CommandPage" : (context) => CommandPage(),
      },
    );
  }
}
