import "package:flutter/material.dart";

import "HomeWidgetView.dart";

class Home extends StatefulWidget {
  @override
  HomeStateController createState() => HomeStateController();
}

class HomeStateController extends State<Home> {
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) => HomeWidgetView(this);
}