import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/controller/command_item_controller.dart';
import 'package:menyou_backend/models/command_items.dart';
import 'package:menyou_backend/models/local_data.dart';

import '../models/Food.dart';



class SingleCommandItem extends StatefulWidget {
  const SingleCommandItem({super.key});

  @override
  _SingleItemPage createState() => _SingleItemPage();

}

class _SingleItemPage extends State<SingleCommandItem>{

  final controller = Get.put(CommandItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

            body:FutureBuilder<List<LocalFood>>(
            future: controller.getAllItems(),
            builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.none){
            return Text("error connect");
            }else if(snapshot.hasError){
            return Text("${snapshot.error}");
            }
            else{
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                  ),
                  SizedBox(height: 16),
                   Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data![index].image ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].name ?? '',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Quantity: ${snapshot.data![index].quantity ?? ''}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Price: ${snapshot.data![index].price * snapshot.data![index].quantity ?? ''}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
              }
            }
          )
      );
  }

}