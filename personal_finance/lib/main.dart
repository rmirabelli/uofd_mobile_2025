import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transaction_card.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(id: UniqueKey().toString(), title: "new shoes", amountInPennies: 5299),
    Transaction(id: UniqueKey().toString(), title: "Groceries", amountInPennies: 8876),
    Transaction(id: UniqueKey().toString(), title: "Coffee", amountInPennies: 478),
  ];

  var titleInput = "";

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Personal Finance')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
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
                      onChanged: (value) => titleInput = value,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "amount"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(titleInput);
                      },
                      child: Text("submit"),
                    ),
                  ],
                ),
              ),
            ),
            Card(child: Container(child: Text('chart'))),
            Column(
              children: transactions.map((transaction) {
                return TransactionCard(transaction);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
