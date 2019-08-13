import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction_list.dart';

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



//  String titleInput;
//  String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
controller: titleController,
//                      onChanged: (val) => amountInput=val,

                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount'
                      ),
controller: amountController,
//                      onChanged: (val){
//                        titleInput = val;
//                      },
                    ),
                    FlatButton(
                      child: Text("Add Transaction",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600
                      ),),
                      onPressed: (){
                        print(titleController.text);

                      },
                    )

                  ],
                ),
              ),
            ),
TransactionList(),

          ],
        ));
  }
}
