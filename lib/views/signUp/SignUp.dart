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
  final referralCodeFocusNode = FocusNode();
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
        error = "";
      });
      var response = await store.signUp(email, firstName, lastName, password, referralCode: referralCode);
      setState((){
        signingUp = false;
      });
      if(response.status == 201) {
        store.navigatorKey.currentState.pushReplacementNamed("/set_bank_details");
      }
      else setState(() {
        if(response.errors["fields"].length != 0)
        print(response.errors["fields"]);
          if(response.errors["fields"].toString().contains("Duplicate"))
            error = "Email aleady in use";
        else error = response.errors["summary"];
      });
    }
  }

  void toSignIn() {
    store.navigatorKey.currentState.pushReplacementNamed("/sign_in");
  }

  @override
  Widget build(BuildContext context) => SignUpWidgetView(this);
}