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
  return Card(
    child: Row(
      children: <Widget>[
        Container(


          margin:EdgeInsets.symmetric(horizontal:15,
              vertical: 10),
          decoration:BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor,width: 2)
          ) ,

          padding: const EdgeInsets.all(10),
          child: Text("\$ ${transactions[index].amount.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.title,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(transactions[index].title,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
            Text(
              DateFormat.yMMMd().format(transactions[index].date),
              style: TextStyle(
                  color: Colors.grey
              ),)
          ],
        )
      ],
    ),
  );
},
            itemCount: transactions.length,

            ),

        
      );
  }
}
