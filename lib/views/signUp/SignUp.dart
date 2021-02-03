import "package:flutter/material.dart";
import 'package:stackclicks_flutter/store/Store.dart';

import "SignUpWidgetView.dart";

class SignUp extends StatefulWidget {
  @override
  SignUpStateController createState() => SignUpStateController();
}

class SignUpStateController extends State<SignUp> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool signingUp = false;
  String firstName = "", lastName = "", email = "", password = "", referralCode = "", error = "";

  @override
  void initState() {
    this.firstNameFocusNode.requestFocus();
    super.initState();
  }

  void signUp() async {
    if(signUpFormKey.currentState.validate()) {
      setState((){
        signingUp = true;
      });
      var response = await store.signUp(email, firstName, lastName, password, referralCode: referralCode);
      setState((){
        signingUp = false;
      });
      if(response.status == 201) {
        store.navigatorKey.currentState.pushReplacementNamed("/dashboard");
      }
      else setState(() {
        if((response.errors["fields"] as String).contains("UNIQUE"))
          error = "Email aleady in use";
      });
    }
  }

  @override
  Widget build(BuildContext context) => SignUpWidgetView(this);
}