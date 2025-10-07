import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

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
              '\$${transaction.amountInPennies / 100}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
          Column(
            children: [
              Text(
                transaction.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
              ),
              Text(
                DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(transaction.date),
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
