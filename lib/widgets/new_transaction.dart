import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  //method to submit the data
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

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

  //method for date picker
  void _presentDatePicker() {
    showDatePicker(
            //global context property
            context: context,
            //intially selected
            initialDate: DateTime.now(),
            //first date can be chosen
            firstDate: DateTime(2019),
            //last date can be chosen
            lastDate: DateTime.now())
        .then((pickedDate) => {
              if (pickedDate == null)
                {}
              else
                {
                  //set the state
                  setState(
                    () {
                      _selectedDate = pickedDate;
                    },
                  )
                }
            });

    //future is a class that are built in dart
    //allow to create object to give value in future
    //eg.. need to wait user to pickup value, dont know when the user enter value
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
              controller: _titleController,
              //  onChanged: (val) {
              //    titleInput = val;
              //  },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              //why anonymoust function?
              //just to evade syntax error
              //this called dumping the value
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //  amountInput = val;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    //wrap text with expanded
                    //to give space
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen!' //! indicate the usage of ? on declaration
                          //use string interpolation to add meaningfull data
                          : 'Picked dated: ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  //execute function submitData()
                  _submitData();
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
