import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/chart.dart';
import 'package:personal_expenses/new_transaction.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:flutter/services.dart';
import 'transaction_list.dart';

main() {
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch:  Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)))),
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
//    Transaction(
//        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
//    Transaction(
//        id: 't2',
//        title: 'Weekly Groceries',
//        amount: 16.53,
//        date: DateTime.now())
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // TODO: implement build
    final PreferredSizeWidget appBar = Platform.isIOS ? CupertinoNavigationBar (
      middle: Text(
        "Personal expenses",
        style: TextStyle(fontFamily: 'Open Sans'),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Icon(CupertinoIcons.add),
            onTap:  () => _startAddNewTransaction(context),
          )
        ],
      ),
    ): AppBar(
      title: Text(
        "Personal expenses",
        style: TextStyle(fontFamily: 'Open Sans'),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            size: 30.0,
          ),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    final txListWidget  = Container(
        height: (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
            0.7,
        child:
        TransactionList(_userTransaction, _deleteTransaction));

    final pageBody = SafeArea (child: SingleChildScrollView(
      child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Show Chart",
                style: Theme.of(context).textTheme.title,),
                Switch.adaptive(
                  activeColor: Theme.of(context).accentColor,
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                )
              ],
            ),


          if(!isLandscape)
            Container(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions)),
          if(!isLandscape) txListWidget,
          if(isLandscape) _showChart
              ?  Container(
              height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
                  0.7,
              child: Chart(_recentTransactions))
              :txListWidget
        ],
      ),
    ),);
    return Platform.isIOS ? CupertinoPageScaffold(child:pageBody ,navigationBar: appBar, ):Scaffold(
      appBar: appBar,
      body:pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => _startAddNewTransaction(context),
        ),

    );
  }
}
