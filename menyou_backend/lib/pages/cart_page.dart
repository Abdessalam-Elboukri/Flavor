import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/widgets/home_navbar.dart';

import '../utils/local_storage.dart';
import '../widgets/items_widget.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localStorage = Get.put(LocalStorage());
    return Center(
      child:Text(
        "${localStorage.readData("1")} \n ${localStorage.readData("1").then((value) => value?.name)}",
      )
    );
  }
}