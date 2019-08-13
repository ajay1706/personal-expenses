import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';
import 'package:intl/intl.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];

  String titleInput;
  String amountInput;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personal expenses"),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(

              width: double.infinity,
              child: Card(

                color: Colors.blueAccent,
                child: Text('CHART!'),
                elevation: 9,
              ),
            ),

            Card(
              elevation: 5,
              
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title'
                      ),
                      onChanged: (val) => amountInput=val,

                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount'
                      ),
                      onChanged: (val){
                        titleInput = val;
                      },
                    ),
                    FlatButton(
                      child: Text("Add Transaction",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600
                      ),),
                      onPressed: (){
                        print(titleInput);
                        print(amountInput);
                      },
                    )

                  ],
                ),
              ),
            ),


            Column(
              children: transaction.map((tx) {
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
            )
          ],
        ));
  }
}
