import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/single_commandtem_widget.dart';

class CommandPage extends StatelessWidget {
  const CommandPage ({Key? key}) : super(key: key);

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
              'MY Commands',
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

      body: SingleCommandItem(),

        );


  }

}
