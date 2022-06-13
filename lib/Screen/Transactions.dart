//show calander along with income /outgoings
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class Transactions extends StatelessWidget {

  const Transactions({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transaction"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//spaces the height evenly
        crossAxisAlignment: CrossAxisAlignment.stretch,//
        children: <Widget>[
        Container(//card is wrapped around containe so it uses container sizing
          width: double.infinity,//takes up entire width
          color: Colors.black,
          child: Card(
            color: Colors.blue,
            child: Text('chart!'),
            elevation: 5,
            ),
        ),
          Card(
            color: Colors.red,
            child: Text('list of tx'),
            )
      ],),
      
    );
  }
}