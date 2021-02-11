import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'Transactions.dart';

class TransactionsWidgetView extends WidgetView<Transactions, TransactionsStateController> {
  TransactionsWidgetView(TransactionsStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return Container();
  }
}