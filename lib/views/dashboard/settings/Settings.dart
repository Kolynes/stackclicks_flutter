import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/ScaffoldMessenger.dart';

import 'SettingsWidgetView.dart';

class Settings extends StatefulWidget {
  @override 
  createState() => SettingsStateController();
}

class SettingsStateController extends State<Settings> with ScaffoldMessenger<Settings> {

  void toChangePassword() async {
    success = (await store.navigatorKey.currentState.pushNamed("/dashboard/settings/change_password")) as String;
  }

  void toChangeBankDetails() async {
    success = (await store.navigatorKey.currentState.pushNamed("/dashboard/settings/change_bank_details")) as String;
  }

  void toAboutPage() async {
    store.navigatorKey.currentState.pushNamed("/about");
  }

  void onLogOutClicked() {
    confirm(
      icon: MdiIcons.power,
      title: "Log Out",
      message: "Do you want to log out?",
      onYes: logOut
    );
  }

  void logOut() async {
    store.navigatorKey.currentState.pop();
    success = "please wait";
    await store.signOut();
    store.navigatorKey.currentState.popUntil((route) => route.isFirst);
  }

  @override 
  Widget build(BuildContext context) => SettingsWidgetView(this);
}