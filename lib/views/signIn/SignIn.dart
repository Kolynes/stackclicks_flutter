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
    if(signInFormKey.currentState.validate() && !signingIn){
      setState((){
        signingIn = true;
        error = "";
      });
      var response = await store.signIn(email.trim(), password.trim());
      if(response.status == 200) {
        store.navigatorKey.currentState.pushReplacementNamed("/dashboard/home");
      }
      else setState((){
        signingIn = false;
        error = response.errors["summary"];
      });
    }
  }

  void toSignUp() async {
    store.navigatorKey.currentState.pushReplacementNamed("/sign_up");
  }

  void toPasswordRecovery() {
    store.navigatorKey.currentState.pushNamed("/password_recovery");
  }

  @override
  Widget build(BuildContext context) => SignInWidgetView(this);
}