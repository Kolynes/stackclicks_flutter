import "package:flutter/material.dart";
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';

import "Home.dart";

class HomeWidgetView extends WidgetView<Home, HomeStateController> {
  HomeWidgetView(HomeStateController state, {Key key}): super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/homebg.jpg")
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
					  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(child: Text("STACKCLICKS"))
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
								  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * .7,
                      child: FlatButton(
                        child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                        onPressed: state.toSignIn
                      ),
                    ),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * .7,
                      child: FlatButton(
                        child: Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                        onPressed: state.toSignUp
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}