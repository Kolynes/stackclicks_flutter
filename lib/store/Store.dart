import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/store/MaterialAppModule.dart';
import 'package:stackclicks_flutter/store/MessagesModule.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/PaymentsModule.dart';
import 'package:stackclicks_flutter/store/TasksModule.dart';
import 'package:stackclicks_flutter/store/VendorsModule.dart';
import 'package:stackclicks_flutter/store/WithdrawalRequestModule.dart';

import 'AccountsModule.dart';

class Store extends PropertyChangeNotifier<ModuleProperties> 
  with
    AccountsModule,
    PaymentsModule,
    TasksModule,
    VendorsModule,
    WithdrawalRequestModule,
    MaterialAppModule,
    MessagesModule
{
  Future<void> init() async {
    await accountsModuleInit();
  }
}

final store = Store();