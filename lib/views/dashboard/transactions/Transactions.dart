import 'package:flutter/material.dart';

import 'TransactionsWidgetView.dart';

class Transactions extends StatefulWidget {
  @override 
  createState() => TransactionsStateController();
}

class TransactionsStateController extends State<Transactions> {
  @override 
  Widget build(BuildContext context) => TransactionsWidgetView(this);
}