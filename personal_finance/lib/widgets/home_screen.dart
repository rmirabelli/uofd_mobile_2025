import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/new_transaction.dart';
import 'user_transaction.dart';
import '../models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return NewTransaction(_addNewTransaction, titleController, amountController);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text('Personal Finance'),
        actions: [
          IconButton(
            onPressed: () {
              startNewTransaction(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(child: Text('chart')),
          UserTransaction(_userTransactions),
        ],
      ),
    );
  }
}
