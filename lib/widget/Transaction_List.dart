// ignore_for_file: prefer_const_constructors
//This stores the transactions and the display panel aka how it looks

import 'package:budget_app/Model/TransactionFormatt.dart';
import 'package:flutter/material.dart';
import '../Model/TransactionFormatt.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
   final List<TransactionFormatt> transactions;
   TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      //each transaction tile
      children: transactions.map((tx) {
        //tx is individual transactin
        return Card(
            color: Colors.white,
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
                    '£ ${tx.amount}', //easier way to combine a text (string interpulation sytntax) no need for .toString either
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 17),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // y axis on all text in column
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //x axis on all text in column
                  children: <Widget>[
                    //contains date and title
                    Container(
                      child: Text(
                        tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ), //Transaction title and styling
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ), //transaction date text and styling
                  ],
                ),
              ],
            ));
      }).toList(),
      //returns each transaction as a list
    );
  }
}
