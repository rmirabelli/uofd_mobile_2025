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
    Transaction(id: UniqueKey().toString(), title: "Shoes", amountInPennies: 5299),
    Transaction(id: UniqueKey().toString(), title: "Groceries", amountInPennies: 8876),
    Transaction(id: UniqueKey().toString(), title: "Coffee", amountInPennies: 478),
    Transaction(id: UniqueKey().toString(), title: "Books", amountInPennies: 2564),
    Transaction(id: UniqueKey().toString(), title: "Cat food", amountInPennies: 6467),
    Transaction(id: UniqueKey().toString(), title: "Poetry", amountInPennies: 123),
    Transaction(id: UniqueKey().toString(), title: "Broom", amountInPennies: 1414),
    Transaction(id: UniqueKey().toString(), title: "TV Subscription", amountInPennies: 1999),
    Transaction(id: UniqueKey().toString(), title: "Candy", amountInPennies: 2057),
    Transaction(id: UniqueKey().toString(), title: "Shirt", amountInPennies: 4077),
    Transaction(id: UniqueKey().toString(), title: "Notebook", amountInPennies: 1298),
    Transaction(id: UniqueKey().toString(), title: "Wildflowers", amountInPennies: 79),
    Transaction(id: UniqueKey().toString(), title: "Perfume", amountInPennies: 1478),
    Transaction(id: UniqueKey().toString(), title: "Sailor hat", amountInPennies: 2983),
    Transaction(id: UniqueKey().toString(), title: "Explosives", amountInPennies: 1999),
    Transaction(id: UniqueKey().toString(), title: "Compact disc", amountInPennies: 878),
    Transaction(id: UniqueKey().toString(), title: "Stuffed dolphin", amountInPennies: 3987),
    Transaction(id: UniqueKey().toString(), title: "Canned tuna", amountInPennies: 1100),
    Transaction(id: UniqueKey().toString(), title: "Bucket", amountInPennies: 555),
    Transaction(id: UniqueKey().toString(), title: "Lasso", amountInPennies: 1276),
    Transaction(id: UniqueKey().toString(), title: "Dance trophy", amountInPennies: 9765),
    Transaction(id: UniqueKey().toString(), title: "Air freshener", amountInPennies: 1429),
    Transaction(id: UniqueKey().toString(), title: "Lego", amountInPennies: 1356),
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
