import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/store/MaterialAppModule.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';

import 'AccountsModule.dart';

class Store extends PropertyChangeNotifier<ModuleProperties> 
  with
    AccountsModule,
    MaterialAppModule
{}

final store = Store();