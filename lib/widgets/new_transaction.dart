import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

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
              // onChanged: (val) {
              //  amountInput = val;
              // },
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  addTx(
                      titleController.text,
                      double.parse(
                        amountController.text,
                      ));
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
