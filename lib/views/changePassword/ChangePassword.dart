import "package:flutter/material.dart";
import 'package:stackclicks_flutter/store/Store.dart';

import "ChangePasswordWidgetView.dart";

class ChangePassword extends StatefulWidget {
  @override
  ChangePasswordStateController createState() => ChangePasswordStateController();
}

class ChangePasswordStateController extends State<ChangePassword> {
  final GlobalKey<FormState> sendVerificationCodeFormKey = GlobalKey();
  final GlobalKey<FormState> verifyCodeFormKey = GlobalKey();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

  String email = "", code = "", newPassword = "";
  bool sendingVerificationCode = false, verifyingCode = false, resettingPassword = false;
  int step = 0;

  void sendVerificationCode() async {
    if(sendVerificationCodeFormKey.currentState.validate()) {
      setState(() {
        sendingVerificationCode = true;
      });
      var response = await store.sendVerificationCode(username: email);
      setState(() {
        sendingVerificationCode = false;
      });
      if(response.status == 200)
        setState(() {
          step++;
        });
    }
  }

  void verifyCode() async {
    if(verifyCodeFormKey.currentState.validate()) {
      setState(() {
        verifyingCode = true;
      });
      var response = await store.verifyCode(email, code);
      setState(() {
        verifyingCode = false;
      });
      if(response.status == 200)
        setState(() {
          step++;
        });
    }
  }

  void resetPassword() async {
    if(resetPasswordFormKey.currentState.validate()) {
      setState(() {
        resettingPassword = true;
      });
      var response = await store.resetPassword(email, code, newPassword);
      setState(() {
        resettingPassword = false;
      });
      if(response.status == 200) 
        store.navigatorKey.currentState.pushReplacementNamed("/dashboard");
    }
  }

  @override
  Widget build(BuildContext context) => ChangePasswordWidgetView(this);
}