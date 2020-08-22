import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/new_transaction.dart';
import 'package:flutter_expense_planner/widgets/user_transaction.dart';
import 'package:flutter_expense_planner/models/transaction.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      home: MyHomePage(),
    );
  }
}

/** stateless widget means we can't change it or we can change it but it will never be reflected in user interface. ***/
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}
class  MyHomePageState extends State<MyHomePage>{

  final List<Transaction> userTranscation = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 68.21, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Shoes', amount: 68.21, date: DateTime.now()),
  ];

  void addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      userTranscation.add(newTx);
    });
  }

  void startAddNewTranscation(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder : (_){
         return NewTransaction(addNewTransaction);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>  startAddNewTranscation(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Text('CHART!!')),
                elevation: 5,
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>  startAddNewTranscation(context),
      ),
    );
  }
}
