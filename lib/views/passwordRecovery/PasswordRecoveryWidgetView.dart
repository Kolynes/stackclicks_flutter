import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/password_form_field/PasswordFormField.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/utils/validators.dart';

import 'PasswordRecovery.dart';

class PasswordRecoveryWidgetView extends WidgetView<PasswordRecovery, PasswordRecoveryStateController> {
  PasswordRecoveryWidgetView(PasswordRecoveryStateController state, {Key key}): super(state, key: key);

  Widget stepOne(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Form(
        key: state.sendVerificationCodeFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Send Verification Code",
                style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter your account's email address below"
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    MdiIcons.emailOutline
                  ),
                ),
                focusNode: state.emailFocusNode,
                validator: emailValidator,
                onChanged: (value) => state.email = value,
                onFieldSubmitted: (value) => state.sendVerificationCode(),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                color: Theme.of(context).primaryColor,
                
                icon: state.sendingVerificationCode
                  ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                  :Icon(MdiIcons.arrowRight),
                onPressed: state.sendVerificationCode
              ),
            ),
          ]
        ),
      )
    );
  }

  Widget stepTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Form(
        key: state.verifyCodeFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Verify Code",
                style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).primaryColor, 
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter the six(6) digit code that was sent to your email."
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Code",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    MdiIcons.numeric
                  ),
                ),
                focusNode: state.codeFocusNode,
                validator: requiredLengthValidator(min: 6),
                onChanged: (value) => state.code = value,
                onFieldSubmitted: (value) => state.verifyCode(),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: state.verifyingCode
                  ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                  :Icon(MdiIcons.arrowRight),
                onPressed: state.verifyCode
              ),
            ),
          ]
        ),
      )
    );
  }

  Widget stepThree(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Form(
        key: state.verifyCodeFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Reset Password",
                style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).primaryColor, 
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter a new password below"
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PasswordFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "New Password",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    MdiIcons.lockOutline
                  ),
                ),
                focusNode: state.passwordFocusNode,
                validator: requiredLengthValidator(min: 6),
                onChanged: (value) => state.newPassword = value,
                onFieldSubmitted: (value) => state.verifyCode(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: state.verifyingCode
                  ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                  :Icon(MdiIcons.arrowRight),
                onPressed: state.verifyCode
              ),
            ),
          ]
        ),
      )
    );
  }

  Widget showStep(BuildContext context) {
    return <Widget>[
      stepOne(context),
      stepTwo(context),
      stepThree(context)
    ][state.step];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Password Recovery",
        ),
        elevation: 0,
      ),
      body: ScrollablePage(
        padding: null,
        safeArea: false,
        child: Column(
          children: <Widget>[
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
            showStep(context)
          ]
        )
      )
    );
  }
}