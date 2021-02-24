import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/password_form_field/PasswordFormField.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/utils/validators.dart';
import 'ChangePassword.dart';

class ChangePasswordWidgetView extends WidgetView<ChangePassword, ChangePasswordStateController> {
  ChangePasswordWidgetView(ChangePasswordStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password")
      ),
      body: ScrollablePage(
        padding: EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
        child: Form(
          key: state.changePasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Fill the form to change your password"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PasswordFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Old Password",
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      MdiIcons.lockOutline
                    ),
                  ),
                  focusNode: state.oldPasswordFocusNode,
                  validator: requiredLengthValidator(min: 6),
                  onChanged: (value) => state.oldPassword = value,
                  onFieldSubmitted: (value) => state.newPasswordFocusNode.requestFocus(),
                ),
              ),
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
                  focusNode: state.newPasswordFocusNode,
                  validator: requiredLengthValidator(min: 6),
                  onChanged: (value) => state.newPassword = value,
                  onFieldSubmitted: (value) => state.changePassword(),
                ),
              ),
              state.error != ""
                ?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.error,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.red,
                    )
                  ),
                )
                :SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: state.changingPassword
                    ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                    :Icon(MdiIcons.arrowRight),
                  onPressed: state.changePassword
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}