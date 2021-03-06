import "package:flutter/material.dart";
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/password_form_field/PasswordFormField.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/utils/validators.dart';

import "SignUp.dart";

class SignUpWidgetView extends WidgetView<SignUp, SignUpStateController> {
  SignUpWidgetView(SignUpStateController state, {Key key}): super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        elevation: 0,
      ),
      body: ScrollablePage(
        padding: null,
        safeArea: false,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 250,
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                    "lib/assets/images/logo.png",
                    width: 100,
                  ),
                  backgroundColor: Colors.white,
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: state.signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "First Name",
                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        focusNode: state.firstNameFocusNode,
                        validator: requiredValidator,
                        onChanged: (value) => state.firstName = value,
                        onFieldSubmitted: (value) => state.lastNameFocusNode.requestFocus(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Last Name",
                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        focusNode: state.lastNameFocusNode,
                        validator: requiredValidator,
                        onChanged: (value) => state.lastName = value,
                        onFieldSubmitted: (value) => state.emailFocusNode.requestFocus(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        focusNode: state.emailFocusNode,
                        validator: emailValidator,
                        onChanged: (value) => state.email = value,
                        onFieldSubmitted: (value) => state.referralCodeFocusNode.requestFocus(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Referral Code (optional)",
                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        focusNode: state.referralCodeFocusNode,
                        onChanged: (value) => state.referralCode = value,
                        onFieldSubmitted: (value) => state.passwordFocusNode.requestFocus(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PasswordFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        focusNode: state.passwordFocusNode,
                        validator: requiredValidator,
                        onChanged: (value) => state.password = value,
                        onFieldSubmitted: (value) => state.signUp()
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.error,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.red
                        )
                      )
                    ),
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
                          child: state.signingUp
                            ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)))
                            :Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                          onPressed: state.signUp
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign in to existing account",
                          style: Theme.of(context).textTheme.button.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                      ),
                      onTap: state.toSignIn
                    )
                  ],
                ),
              )
            )
          ],
        )
      )
    );
  }
}