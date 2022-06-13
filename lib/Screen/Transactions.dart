//show calander along with income /outgoings
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import './TransactionList.dart'; //imports the transaction list

class Transactions extends StatelessWidget {
  final List<TransactionList> transactions = [
    TransactionList(
      id: "t1",
      title: "hello",
      amount: 69.69,
      date: DateTime.now(),
    ),
    TransactionList(
      id: "t2",
      title: "groceries",
      amount: 15.23,
      date: DateTime.now(),
    ),
  ]; //var that holds list of transactions

  Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction"),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, //spaces the height evenly
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
          ),
          Column(//each transaction tile
            children: transactions.map((tx) {
              //tx is individual transactin
              return Card(
                child: Text(tx.title),
              );
            }).toList(),
            //returns each transaction as a list
          )
        ],
      ),
    );
  }
}
