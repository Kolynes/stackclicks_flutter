
import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {

  @protected final Widget child;
  @protected final EdgeInsets padding;

  ScrollablePage({@required this.child, this.padding = const EdgeInsets.only(left: 15, right: 15)}): super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: this.padding,
        child: this.child
      )
    );
  }

}