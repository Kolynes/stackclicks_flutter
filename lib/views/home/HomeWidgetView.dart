import "package:flutter/material.dart";
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';

import "Home.dart";

class HomeWidgetView extends WidgetView<Home, HomeStateController> {
  HomeWidgetView(HomeStateController state, {Key key}): super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/homebg.jpg"),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
					      crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/images/logo.png",
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Stackclicks",
                      style: Theme.of(context).textTheme.headline3
                    ),
                  ),
                ],
              ))
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * .7,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        )
                      ),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                        onPressed: state.toSignIn
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * .7,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        ),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor
                        )
                      ),
                      child: FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                        onPressed: state.toSignUp
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Are you new here? ",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        InkWell(
                          child: Text(
                            "About us",
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w800
                            ),
                          ),
                          onTap: state.toAbout
                        ),
                      ],
                    ),
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}