import 'package:flutter/material.dart';
import '../Model/TransactionFormatt.dart';
import 'Transaction_List.dart';
import 'new_Transaction.dart';

class UserTransactions extends StatefulWidget {

  @override
 _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<TransactionFormatt> _userTransactions = [
    TransactionFormatt(
      id: "t1",
      title: "books",
      amount: 69.69,
      date: DateTime.now(),
    ),
    TransactionFormatt(
      id: "t2",
      title: "groceries",
      amount: 15.23,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount){
   final newTx = TransactionFormatt(
    amount : txAmount,
    title:txTitle, 
    
    date: DateTime.now(),
    id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
      //updates the list and due to set state will update ui to add new transaction
    });
  }

  @override
  //this builds a UI containing the transactions and transaction input field
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        newTransaction(_addNewTransaction),//passes the new transaction to the newTrnsavtioon page to access private method
        TransactionList(_userTransactions),
      ],
    );
  }
}
