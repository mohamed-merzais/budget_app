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
          Column(
            //each transaction tile

            children: transactions.map((tx) {
              //tx is individual transactin
              return Card(

                  //each transaction with price date and name
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15), //spacing around price
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )), //decorating the container(price)
                    padding: EdgeInsets.all(10), //space between border and text
                    child: Text(
                      //contains price text
                      '£ ${tx.amount}',//easier way to combine a text (string interpulation sytntax) no need for .toString either
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 16),
                    ),
                  ),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly, // y axis on all text in column
                    crossAxisAlignment: CrossAxisAlignment.start,//x axis on all text in column
                    children: <Widget>[
                      //contains date and title
                      Container(
                          child: Text(
                        tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),
                      ),), //Transaction title
                      Text(tx.date.toString(),style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 12,
                      ),),//transaction date
                    ],
                  ),
                ],
              ));
            }).toList(),
            //returns each transaction as a list
          )
        ],
      ),
    );
  }
}
