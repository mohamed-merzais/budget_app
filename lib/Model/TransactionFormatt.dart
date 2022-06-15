// ignore: empty_constructor_bodies
class TransactionFormatt {
  //this is what each transaction will contain.
  String id;
  String title;
  double amount;
  DateTime date;

  TransactionFormatt(
      {required this.id,
      required this.amount,
      required this.date,
      required this.title});
  //takes the function and adds peramters aka whats required from each transaction

}
