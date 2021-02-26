import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/models.dart';
import 'package:stackclicks_flutter/routes/routes.dart';
import 'package:stackclicks_flutter/utils/models.dart';

import 'store/Store.dart';
import 'themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ModelManager.registerModels(models);
  await store.init();
  runApp(
    PropertyChangeProvider<Store>(
      value: store, 
      child: MaterialApp(
        title: "Stackclicks", 
        routes: routes,
        initialRoute: store.user != null
          ?"/dashboard/home"
          :"/",
        theme: appTheme,
        navigatorKey: store.navigatorKey,
      )
    )
  );
}