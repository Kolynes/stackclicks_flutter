import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/utils/ScaffoldMessenger.dart';

import 'TransactionsWidgetView.dart';

class Transactions extends StatefulWidget {
  @override 
  createState() => TransactionsStateController();
}

class TransactionsStateController extends State<Transactions> with ScaffoldMessenger<Transactions>{
  @override 
  Widget build(BuildContext context) => TransactionsWidgetView(this);
}