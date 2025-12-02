import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  const UserTransaction(this._userTransactions, {super.key});
  final List<Transaction> _userTransactions;

  @override
  Widget build(BuildContext context) {
    return Column(children: [TransactionList(_userTransactions)]);
  }
}
