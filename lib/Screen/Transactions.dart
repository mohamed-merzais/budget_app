//show calander along with income /outgoings
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:budget_app/widget/user_Transactions.dart';

import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  //statless means cant change variables and will never be reflected on the ui

  String titleInput = ''; //store title
  String amountInput = ''; //store amount

  Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction"),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, //spaces the height to the top
        crossAxisAlignment: CrossAxisAlignment.stretch, //
        children: <Widget>[
          Container(
            //card is wrapped around containe so it uses container sizing
            width: double.infinity, //takes up entire width
            color: Colors.black,
            child: Card(
              color: Colors.blue,
              child: Text('chart!'),
              elevation: 5,
            ),
          ), //chart
          //below is the input for user
          UserTransactions(),//shows the users transactions and input field 
        ],
      ),
    );
  }
}
