import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
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
