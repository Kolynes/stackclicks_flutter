import "package:flutter/material.dart";
import 'package:stackclicks_flutter/store/Store.dart';

import "SignInWidgetView.dart";

class SignIn extends StatefulWidget {
  @override
  SignInStateController createState() => SignInStateController();
}

class SignInStateController extends State<SignIn> {
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  String email = "", password = "", error = "";
  bool signingIn = false;

  @override
  void initState() {
    emailFocusNode.requestFocus();
    super.initState();
  }

  void signIn() async {
    if(signInFormKey.currentState.validate()){
      setState((){
        signingIn = true;
      });
      var response = await store.signIn(email, password);
      if(response.status == 200) {
        store.navigatorKey.currentState.pushReplacementNamed("/dashboard");
      }
      else setState((){
        signingIn = false;
        error = response.errors["summary"];
      });
    }
  }

  @override
  Widget build(BuildContext context) => SignInWidgetView(this);
}