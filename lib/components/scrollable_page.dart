
import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {

  @protected final Widget child;
  @protected final EdgeInsets padding;
  @protected final bool safeArea;

  ScrollablePage({@required this.child, this.padding = const EdgeInsets.only(left: 15, right: 15), this.safeArea: true}): super();

  @override
  Widget build(BuildContext context) {
    return safeArea
      ?SafeArea(
        child: SingleChildScrollView(
          padding: padding,
          child: child
        )
      )
      :SingleChildScrollView(
        padding: padding, 
        child: child
      );
  }

}