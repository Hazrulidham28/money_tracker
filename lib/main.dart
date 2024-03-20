import 'package:flutter/material.dart';
import 'package:money_tracker/transaction.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transactions = [
    Transaction(
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
    ),
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
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
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add transaction'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            //called map value
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        //put back slash to add dollar sign by using string interpolation
                        '\$${tx.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      //move the element in the column to the left or start
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
