import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/widgets/chart.dart';
import 'package:money_tracker/widgets/new_transaction.dart';
import 'package:money_tracker/widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  //tell the system to only allows portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//format document shift + alt + f
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      //what class to be home
      home: MyHomePage(),
      //to set the primary theme of the application
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
      ),
      //remove debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //fill the data for transaction
  final List<Transaction> _userTransactions = [
    /* Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ), */
  ];

  //sort the transaction to get latest 7 day transaction
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  //to add new transaction into the list
  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    //pass to Transaction class's constructor
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());
    //set the state or apply the state
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransactions(String id) {
    setState(() {
      //.removeWhere is method in list with some condition
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  //create method to show add transaction or input area
  void startAddNewTransaction(BuildContext ctx) {
    //to hide and display
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          //pass pointer
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //why intialize appbar?
    //to get its height
    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      //add something to appbar
      actions: [
        IconButton(
          onPressed: () => startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      //make the body scrollable
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          //column can has children which can consist multiple child
          children: <Widget>[
            Container(
              //to make the chart takes 40% of the screen with appbar and status bar which are padding top excluded
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(_userTransactions, _deleteTransactions)),
          ],
        ),
      ),
      //action buttom
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        //any icon or picture
        child: const Icon(Icons.add),
        //what happent when pressed?
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
