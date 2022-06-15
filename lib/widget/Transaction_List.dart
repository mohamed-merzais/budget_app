// ignore_for_file: prefer_const_constructors

import 'package:budget_app/Model/TransactionFormatt.dart';
import 'package:flutter/material.dart';
import '../Model/TransactionFormatt.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionFormatt> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          //index here is the tx list order so 0 is first etc which is used to retrieve the data below as transactions[index]."whatever"
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
                      '£ ${transactions[index].amount.toStringAsFixed(2)}',
                      //easier way to combine a text (string interpulation sytntax) no need for .toString either,
                      //toStringAsFixed(2) = only 2 decimal places
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
                          transactions[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ), //Transaction title and styling
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
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
        },
        itemCount: transactions.length,
        //returns each transaction as a list
      ),
    );
  }
}
