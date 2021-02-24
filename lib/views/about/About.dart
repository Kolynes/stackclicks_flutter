import "package:flutter/material.dart";
import "AboutWidgetView.dart";

class About extends StatefulWidget {
  @override
  AboutStateController createState() => AboutStateController();
}

class AboutStateController extends State<About> {

  @override
  Widget build(BuildContext context) => AboutWidgetView(this);
}