import "package:flutter/material.dart";
import 'package:stackclicks_flutter/store/Store.dart';

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

  toSignUp() {
    store.navigatorKey.currentState.pushNamed("/sign_up");
  }

  toSignIn() {
    store.navigatorKey.currentState.pushNamed("/sign_in");
  }

  toAbout() {
    store.navigatorKey.currentState.pushNamed("/about");
  }

  @override
  Widget build(BuildContext context) => HomeWidgetView(this);
}