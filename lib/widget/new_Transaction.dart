//is a widget that contains textfield and button to add a new transaction
// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class newTransaction extends StatelessWidget {
  final Function addTx;
  var amountInputController = TextEditingController();
  var titleInputController = TextEditingController();
  newTransaction(this.addTx, {Key? key}) : super(key: key); //passes new transaction as parameter

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
                onChanged: (val) {
                  amountInputController = val as TextEditingController;
                }, //checks to see if text is changed and sets ti to the var
                decoration:
                    InputDecoration(labelText: 'Enter title')), //input title
            TextField(
                onChanged: (val) {
                  titleInputController = val as TextEditingController;
                }, //checks to see if text is changed and sets ti to the var title
                decoration: InputDecoration(
                    labelText: 'Enter amount')), //input £ amount
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                addTx(titleInputController.text,
                    double.parse(amountInputController.text),);
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
