import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';

import 'Settings.dart';

class SettingsWidgetView extends WidgetView<Settings, SettingsStateController> {
  SettingsWidgetView(SettingsStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      key: state.scaffoldKey,
      appBar: AppBar(
        title: Text("Settings"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                MdiIcons.bankOutline
              ),
              title: Text("Change Bank Details"),
              onTap: state.toChangeBankDetails
            ),
            Divider(
              indent: 60,
            ),
            ListTile(
              leading: Icon(
                MdiIcons.lockOutline
              ),
              title: Text("Change Password"),
              onTap: state.toChangePassword,
            ),
            Divider(
              indent: 60,
            ),
            ListTile(
              leading: Icon(
                MdiIcons.informationOutline
              ),
              title: Text("About Stackclicks"),
              onTap: state.toAboutPage,
            ),
            Divider(
              indent: 60,
            ),
            ListTile(
              leading: Icon(
                MdiIcons.power
              ),
              title: Text("Log Out"),
              onTap: state.onLogOutClicked
            ),
            Divider(
              indent: 60,
            ),
          ],
        ),
      )
    );
  }
}