// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //make the transaction model can be stored in list
  final List<Transaction> transactions;
  //constructor
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    //to make it scrollable on the list
    //wrap with container and defined it height
    //then wrap with single child scroll view
    return Container(
      height: 350,
      //list view is same as column but it scrollable
      // list view builder is better performance than listview
      child: transactions.isEmpty
          ? Column(
              //if no transaction execute this
              children: [
                Text(
                  'No transaction added yet!',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              //use item builder to display list of card or widgets
              //more efficient for list
              itemBuilder: (ctx, index) {
                return Card(
                  //has card
                  //for one item in list
                  //then repeat for other
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    //there is format for this in flutter
                    //consist of leading, title and subtitle
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            //text in circle avatar
                            '\$${transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
