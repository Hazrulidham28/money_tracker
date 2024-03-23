import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/new_transaction.dart';
import 'package:money_tracker/widgets/transaction_list.dart';
import 'package:money_tracker/widgets/user_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//format document shift + alt + f
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //fill the data for transaction

  //String titleInput = "";
  // String amountInput = "";
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),

        //add something to appbar
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Chart!'),
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
