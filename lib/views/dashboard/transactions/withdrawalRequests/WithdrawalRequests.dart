import 'package:flutter/material.dart';

import 'WithdrawalRequestsWidgetView.dart';

class WithdrawalRequests extends StatefulWidget {
  @override 
  createState() => WithdrawalRequestsStateController();
}

class WithdrawalRequestsStateController extends State<WithdrawalRequests> {
  @override 
  Widget build(BuildContext context) => WithdrawalRequestsWidgetView(this);
}