import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: UniqueKey().toString(), title: "new shoes", amountInPennies: 5299),
    Transaction(id: UniqueKey().toString(), title: "Groceries", amountInPennies: 8876),
    Transaction(id: UniqueKey().toString(), title: "Coffee", amountInPennies: 478),
  ];

  void _addNewTransaction(String title, int amount) {
    final newTransaction = Transaction(title: title, amountInPennies: amount);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [NewTransaction(_addNewTransaction), TransactionList(_userTransactions)]);
  }
}
