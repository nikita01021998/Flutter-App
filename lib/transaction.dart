import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/****Transaction is not itself a widget. Its a normal class/object. Its not extending statelesswidget/statefulwidget*/
class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
