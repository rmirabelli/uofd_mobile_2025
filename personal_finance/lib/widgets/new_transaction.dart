import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this._addTransaction, this.titleController, this.amountController);
  //   final titleController = TextEditingController();
  //   final amountController = TextEditingController();
  final TextEditingController titleController;
  final TextEditingController amountController;
  final Function(String, int) _addTransaction;

  void _submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = (double.parse(amountController.text) * 100).toInt();
    if (enteredTitle.isEmpty || enteredAmount < 0) return;

    _addTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => {_submitTransaction()},
              onTapOutside: (_) => {FocusManager.instance.primaryFocus?.unfocus()},
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "amount"),
              controller: amountController,
              onSubmitted: (_) => {_submitTransaction()},
              onTapOutside: (_) => {FocusManager.instance.primaryFocus?.unfocus()},
            ),
            ElevatedButton(
              onPressed: () {
                _submitTransaction();
              },
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
