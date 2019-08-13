import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

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
    return
      Column(
        children: _userTransaction.map((tx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(

                  margin:EdgeInsets.symmetric(horizontal:15,
                      vertical: 10),
                  decoration:BoxDecoration(
                      border: Border.all(color: Colors.redAccent,width: 2)
                  ) ,

                  padding: const EdgeInsets.all(10),
                  child: Text("\$ ${tx.amount}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.redAccent

                    ),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tx.title,style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                          color: Colors.grey
                      ),)
                  ],
                )
              ],
            ),
          );
        }).toList(),
      );
  }
}
