import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(width: 2, color: Colors.black),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              '\$' + (transaction.amountInPennies / 100).toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
          Column(children: [Text(transaction.title), Text(transaction.date.toString())]),
        ],
      ),
    );
  }
}
