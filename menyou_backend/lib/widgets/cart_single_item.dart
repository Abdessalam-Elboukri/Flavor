import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/utils/local_storage.dart';

import '../models/local_data.dart';


class SingleItemPage extends StatefulWidget {
  const SingleItemPage({super.key});

  @override
  _SingleItemPage createState() => _SingleItemPage();

}

class _SingleItemPage extends State<SingleItemPage>{

  final controller=Get.put(LocalStorage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<LocalFood>>(
        future: controller.readData(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.none){
            return Text("error connect");
          }else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          else{
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.30,
                          child: Image.network(snapshot.data![index].image,
                          width:double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                          ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].name,
                                    style: const TextStyle(
                                    fontSize: 15.00,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  snapshot.data![index].category),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "quantity : ${snapshot.data![index].quantity}",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                          MaterialStateProperty.all<
                                              Color>(Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<
                                              Color>(Colors.green),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.zero,
                                                  side: BorderSide(color: Colors.green)))),
                                      onPressed: () {

                                      },
                                      child: Text(
                                         "\$ ${snapshot.data![index].price * snapshot.data![index].quantity}" ,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),

                                      ),
                                     )
                                ],
                              )
                            ]),
                      )
                      ),
                      Container(
                        height: 20,
                      )
                    ],
                  );
                },
                );

          }
        }
      ),
    );
  }

}