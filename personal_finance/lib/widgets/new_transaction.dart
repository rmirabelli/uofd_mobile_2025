import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this._addTransaction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function(String, int) _addTransaction;
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
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "amount"),
              controller: amountController,
            ),
            ElevatedButton(
              onPressed: () {
                _addTransaction(titleController.text, int.parse(amountController.text));
              },
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
