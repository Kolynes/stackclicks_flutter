import 'package:flutter/widgets.dart';
import 'package:stackclicks_flutter/views/home/Home.dart';
import 'package:stackclicks_flutter/views/signIn/SignIn.dart';

final routes = <String, WidgetBuilder> {
  "/": (context) => Home(),
  "/signIn": (context) => SignIn()
};