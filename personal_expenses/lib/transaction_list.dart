import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {

final List<Transaction> transactions;
TransactionList(this.transactions);


  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            children: transactions.map((tx) {
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
          ),
        ),
      );
  }
}
