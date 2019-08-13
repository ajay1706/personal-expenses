import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';
main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget{
  final List<Transaction> transaction =[
    Transaction(id: 't1',title: 'New Shoes',amount: 69.99,date: DateTime.now()),
    Transaction(id: 't2',title: 'Weekly Groceries',amount: 16.53,date: DateTime.now())

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal expenses"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        width: double.infinity,

        child: Card(

          color: Colors.blueAccent,

           child: Text('CHART!'),
          elevation: 9,

        ),
      ),
      Card(child: Text('LIST OF TX'),
      color: Colors.redAccent,)
    ],
    ));
  }
}
