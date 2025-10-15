import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/home_screen.dart';
import 'package:personal_finance/widgets/new_transaction.dart';
import 'package:personal_finance/widgets/user_transaction.dart';
import 'models/transaction.dart';
import 'widgets/transaction_card.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
