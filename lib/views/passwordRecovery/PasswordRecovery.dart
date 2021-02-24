import "package:flutter/material.dart";
import 'package:stackclicks_flutter/store/Store.dart';

import "PasswordRecoveryWidgetView.dart";

class PasswordRecovery extends StatefulWidget {
  @override
  PasswordRecoveryStateController createState() => PasswordRecoveryStateController();
}

class PasswordRecoveryStateController extends State<PasswordRecovery> {
  final GlobalKey<FormState> sendVerificationCodeFormKey = GlobalKey();
  final GlobalKey<FormState> verifyCodeFormKey = GlobalKey();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final codeFocusNode = FocusNode();

  String email = "", code = "", newPassword = "";
  bool sendingVerificationCode = false, verifyingCode = false, resettingPassword = false;
  int step = 0;

  @override 
  void initState() {
    emailFocusNode.requestFocus();
    super.initState();
  }

  void sendVerificationCode() async {
    if(sendVerificationCodeFormKey.currentState.validate() && !sendingVerificationCode) {
      setState(() {
        sendingVerificationCode = true;
      });
      var response = await store.sendVerificationCode(username: email.trim());
      setState(() {
        sendingVerificationCode = false;
      });
      if(response.status == 200)
        setState(() {
          step++;
          passwordFocusNode.requestFocus();
        });
    }
  }

  void verifyCode() async {
    if(verifyCodeFormKey.currentState.validate() && !verifyingCode) {
      setState(() {
        verifyingCode = true;
      });
      var response = await store.verifyCode(email.trim(), code.trim());
      setState(() {
        verifyingCode = false;
      });
      if(response.status == 200)
        setState(() {
          step++;
          codeFocusNode.requestFocus();
        });
    }
  }

  void resetPassword() async {
    if(resetPasswordFormKey.currentState.validate() && !resettingPassword) {
      setState(() {
        resettingPassword = true;
      });
      var response = await store.resetPassword(email.trim(), code.trim(), newPassword.trim());
      setState(() {
        resettingPassword = false;
      });
      if(response.status == 200) 
        store.navigatorKey.currentState.pushReplacementNamed("/dashboard/home");
    }
  }

  @override
  Widget build(BuildContext context) => PasswordRecoveryWidgetView(this);
}