import 'dart:math';

class Transaction {
  String id;
  String title;
  int amountInPennies;
  DateTime date = DateTime.now().subtract(Duration(days: Random().nextInt(7)));

  Transaction({this.id = "", this.title = "", this.amountInPennies = 0});
}
