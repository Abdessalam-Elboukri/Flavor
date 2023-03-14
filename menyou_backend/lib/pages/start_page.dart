import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/single_item_nav.dart';


class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                        'lib/assets/images/bg_start.png',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 180,
                            height: 180,
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Icon(
                                Icons.food_bank_outlined,
                                color: Colors.white,
                                size: 130
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text('Welcome ❤ User',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      SizedBox(height: 40),
                      Text('Best Food Ever \n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          )
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "RestaurantsPage");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight:Radius.circular(20),
                                bottomLeft:Radius.circular(20),
                                topLeft: Radius.circular(20)
                              )
                          ),
                          child: Column(
                            children:[
                              Align(
                                alignment: Alignment.center,
                                child:  Text("Let's Start",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}