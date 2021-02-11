import 'package:flutter/material.dart';

import 'HomeWidgetView.dart';

class Home extends StatefulWidget {
  @override
  createState() => HomeStateController();
}

class HomeStateController extends State<Home> {
  @override
  Widget build(BuildContext context) => HomeWidgetView(this);
}