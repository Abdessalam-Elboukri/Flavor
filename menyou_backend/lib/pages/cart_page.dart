import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menyou_backend/controller/command_controller.dart';
import 'package:menyou_backend/pages/restaurantsPage.dart';
import 'package:menyou_backend/repository/command_repository.dart';
import '../utils/local_storage.dart';
import '../widgets/cart_single_item.dart';


class CartPage extends StatefulWidget    {
  const CartPage({super.key});

  @override
  _CartPage createState() => _CartPage();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CartPage extends State<CartPage>  {


  final localStorage = Get.put(LocalStorage());
  final controller =Get.put(CommandController());
  final controller2 =Get.put(CommandRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.9),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
          ),
          child: const Center(
                      child: Text(
              'MY Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 180,
      ),

      body: SingleItemPage(),
      bottomNavigationBar:
      Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text("Total Items",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10,),
                Text("",
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
                    controller.createCommande();

                    Navigator.pushNamed(context, "Home");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.green,
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






