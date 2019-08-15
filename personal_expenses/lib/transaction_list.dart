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

          child:transactions.isEmpty?
              Column(
                children: <Widget>[
                  Text("No Transactions added yet",
                  style: Theme.of(context).textTheme.title,),

              SizedBox(height: 20,),
               Container(
                   height: 200,
                   child: Image.asset('images/waiting.png',fit: BoxFit.cover,)),
                ],
              )
              : ListView.builder(
itemBuilder: (ctx,index){
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FittedBox(
            child: Text("\$${transactions[index].amount}")),
      ),
    ),
    title: Text(
      transactions[index].title,style: Theme.of(context).textTheme.title,
    ),
    subtitle:Text(DateFormat.yMMMd().format( transactions[index].date)) ,
  );
},
            itemCount: transactions.length,

            ),

        
      );
  }
}
