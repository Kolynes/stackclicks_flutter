import 'package:flutter/widgets.dart';
import 'package:stackclicks_flutter/store/Store.dart';

import 'ChangePasswordWidgetView.dart';

class ChangePassword extends StatefulWidget {
  @override 
  createState() => ChangePasswordStateController();
}

class ChangePasswordStateController extends State<ChangePassword> {
  final changePasswordFormKey = GlobalKey<FormState>();
  final newPasswordFocusNode = FocusNode();
  final oldPasswordFocusNode = FocusNode();

  String oldPassword = "", newPassword = "", error = "";
  bool changingPassword = false;

  @override 
  void initState() {
    oldPasswordFocusNode.requestFocus();
    super.initState();
  }

  void changePassword() async {
    if(changePasswordFormKey.currentState.validate()) {
      setState(() {
        changingPassword = true;
      });
      var response = await store.changePassword(newPassword, oldPassword);
      setState(() {
        changingPassword = false;
      });
      if(response.status == 200)
        store.navigatorKey.currentState.pop("Password Changed");
      else setState(() => error = response.errors["summary"]);
    }
  }

  @override 
  Widget build(BuildContext context) => ChangePasswordWidgetView(this);
}