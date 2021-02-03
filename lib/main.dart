import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/routes/routes.dart';

import 'store/Store.dart';
import 'themes.dart';

void main() async {
  runApp(
    PropertyChangeProvider<Store>(
      value: store,
      child: MaterialApp(
        title: "Stackclicks",
        routes: routes,
        initialRoute: "/",
        theme: appTheme,
        navigatorKey: store.navigatorKey,
        scaffoldMessengerKey: store.scaffoldMessagerKey,
      )
    )
  );
}