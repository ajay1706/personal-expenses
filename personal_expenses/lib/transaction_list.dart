import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

 final List<Transaction> _userTransaction = [
   Transaction(
       id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
   Transaction(
       id: 't2',
       title: 'Weekly Groceries',
       amount: 16.53,
       date: DateTime.now())
 ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
