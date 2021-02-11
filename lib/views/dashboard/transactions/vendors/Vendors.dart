import 'package:flutter/material.dart';

import 'VendorsWidgetView.dart';

class Vendors extends StatefulWidget {
  @override 
  createState() => VendorsStateController();
}

class VendorsStateController extends State<Vendors> {
  @override 
  Widget build(BuildContext context) => VendorsWidgetView(this);
}