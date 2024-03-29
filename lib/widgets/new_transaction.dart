import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //to pass the function for adding new transactions
  final Function addTx;

  //constructor
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //to retrieve input from user
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //method to submit the data
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    //execute addTx() that in main.dart
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //each text field can has controller to control the text
              controller: titleController,
              //  onChanged: (val) {
              //    titleInput = val;
              //  },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              //why anonymoust function?
              //just to evade syntax error
              //this called dumping the value
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //  amountInput = val;
              // },
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  //execute function submitData()
                  submitData();
                },
                child: const Text('Add transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
