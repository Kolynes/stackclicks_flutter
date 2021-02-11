import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';

mixin MaterialAppModule on PropertyChangeNotifier<ModuleProperties> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}