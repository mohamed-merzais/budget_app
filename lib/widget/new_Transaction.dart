//is a widget that contains textfield and button to add a new transaction
// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';

class newTransaction extends StatelessWidget {
  final Function addTx;
  final amountInputController = TextEditingController(); //stores users amount
  final titleInputController =
      TextEditingController(); //stores users transaction title

  newTransaction(this.addTx);
  void submitData() {
    final enteredAmount = double.parse(amountInputController.text);
    final enteredTitle = titleInputController.text;
    //validatong textfields are not empty
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;//this prevents next code from being executed
    }
    addTx(
     enteredTitle,
     enteredAmount,
    );
  }

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
                keyboardType: TextInputType.text, //shows text keyboard
                onSubmitted: (_) => submitData(),
                decoration:
                    InputDecoration(labelText: 'Enter title')), //input title
            TextField(
                controller: amountInputController,
                keyboardType: TextInputType.number, //shows number keyboard
                onSubmitted: (_) => submitData(),//submits the data if user hits enter on keyboard
                decoration: InputDecoration(
                    labelText: 'Enter amount')), //input £ amount
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {//can add to make sure fields arent empty with if statement
                submitData();},
              child: Text("Add Transaction"),
              textColor: Colors.purple,
            ) //button to add transaction
          ],
        ),
      ),
    );
  }
}
