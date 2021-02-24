import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

mixin ScaffoldMessenger<W extends StatefulWidget> on State<W> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  set error(String error) {
    if(error != null)
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Row(
            children: <Widget>[
              Icon(MdiIcons.exclamationThick, color: Colors.red),   
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(error)
              )
            ]
          ),
          action: SnackBarAction(
            label: "Close",
            onPressed: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
            },
          )
        )
      );
  }
  
  set success(String message) {
    if(message != null)
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Row(
            children: <Widget>[
              Icon(MdiIcons.informationOutline),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(message)
              )
            ]
          ),
          action: SnackBarAction(
            label: "Close",
            onPressed: () {
              scaffoldKey.currentState.hideCurrentSnackBar();
            },
          )
        )
      );
  }

  void confirm({String title, String message, IconData icon, String yes: "Yes", String no: "No", Function onYes}) {
    if(message != null)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(icon),
                ),
                Text(title)
              ]
            ),
            content: Text(message),
            actions: [
              FlatButton(
                child: Text(yes),
                splashColor: Theme.of(context).primaryColor,
                color: Theme.of(context).primaryColor,
                onPressed: onYes != null
                  ?onYes
                  :() => Navigator.pop(context),
              ),
              FlatButton(
                splashColor: Theme.of(context).primaryColor.withAlpha(100),
                child: Text(no, style: TextStyle(color: Theme.of(context).primaryColor)),
                onPressed: () => Navigator.pop(context),
              )
            ]
          );
        }
      );
  }
}