import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._userTransactions);
  final List<Transaction> _userTransactions;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _userTransactions.length,
        itemBuilder: (ctx, index) {
          Transaction transaction = _userTransactions[index];
          return TransactionCard(transaction);
        },
      ),
    );
  }
}
