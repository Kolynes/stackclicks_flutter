import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/store/Store.dart';

import 'SettingsWidgetView.dart';

class Settings extends StatefulWidget {
  @override 
  createState() => SettingsStateController();
}

class SettingsStateController extends State<Settings> {

  void toChangePassword() {
    store.navigatorKey.currentState.pushNamed("/dashboard/settings/change_password");
  }

  void toChangeBankDetails() {
    store.navigatorKey.currentState.pushNamed("/dashboard/settings/change_bank_details");
  }

  @override 
  Widget build(BuildContext context) => SettingsWidgetView(this);
}