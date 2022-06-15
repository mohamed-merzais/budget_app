//is a widget that contains textfield and button to add a new transaction
// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';

class newTransaction extends StatelessWidget {
  final Function addTx;
  final amountInputController = TextEditingController();//stores users amount
  final titleInputController = TextEditingController();//stores users transaction title

  newTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, //elevate the shadows to make it look taller
      child: Container(
        color: Colors.blue, //background colour of data entry
        padding: EdgeInsets.all(10), //spacing between textfields
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, //moves button to right
          children: <Widget>[
            TextField(
                 controller: titleInputController,
                decoration:
                    InputDecoration(labelText: 'Enter title')), //input title
            TextField(
                controller: amountInputController,
                decoration: InputDecoration(
                    labelText: 'Enter amount')), //input £ amount
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                addTx(
                titleInputController.text, 
                double.parse(amountInputController.text),
                // date: DateTime.now(),
                // id: DateTime.now().toString(),
                );
              },
              child: Text("Add Transaction"),
              textColor: Colors.purple,
            ) //button to add transaction
          ],
        ),
      ),
    );
  }
}
