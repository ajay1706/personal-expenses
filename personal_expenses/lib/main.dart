import 'package:flutter/material.dart';
import 'package:personal_expenses/new_transaction.dart';
import 'package:personal_expenses/models/transaction.dart';

import 'transaction_list.dart';

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

class MyHomePage extends StatefulWidget {



//  String titleInput;
//  String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];
  void _addNewTransaction(String txTitle,double txAmount){
    final newTx = Transaction(title: txTitle,amount: txAmount,date: DateTime.now(),
        id:DateTime.now().toString() );

    setState(() {
      _userTransaction.add(newTx);
    });}

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque, );
   },  );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal expenses"),
        actions: <Widget>[
          IconButton(icon: Icon(
            Icons.add,
            size: 30.0,
          ),
            onPressed:() => _startAddNewTransaction(context),)
        ],

      ),
      body:
      SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Padding(
        padding: const EdgeInsets.only(bottom: 20.0),

        child:FloatingActionButton(

          child: Icon(Icons.add,size: 30,),
          onPressed: () => _startAddNewTransaction(context),
        ),),
    );
  }
  }


