import 'package:flutter/material.dart';

import 'PaymentsWidgetView.dart';

class Payments extends StatefulWidget {
  @override 
  createState() => PaymentsStateController();
}

class PaymentsStateController extends State<Payments> {
  int page = 1;

  
  @override 
  Widget build(BuildContext context) => PaymentsWidgetView(this);
}