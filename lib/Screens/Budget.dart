//users can input their data.
//incomings outgoings daily show the current date at top with all their info
import 'package:flutter/material.dart';
class Budget extends StatefulWidget {
  const Budget({ Key? key }) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget tracker"),
      ), 
      
      
    );
  }
}