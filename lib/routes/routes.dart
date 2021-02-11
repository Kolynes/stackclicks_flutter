import 'package:flutter/widgets.dart';
import 'package:stackclicks_flutter/views/dashboard/tasks/Tasks.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/Transactions.dart';
import 'package:stackclicks_flutter/views/home/Home.dart';
import 'package:stackclicks_flutter/views/passwordRecovery/PasswordRecovery.dart';
import 'package:stackclicks_flutter/views/setBankDetails/SetBankDetails.dart';
import 'package:stackclicks_flutter/views/signIn/SignIn.dart';
import 'package:stackclicks_flutter/views/signUp/SignUp.dart';
import 'package:stackclicks_flutter/views/dashboard/home/Home.dart' as dashboardHome;
import 'package:stackclicks_flutter/views/dashboard/settings/Settings.dart';
import 'package:stackclicks_flutter/views/dashboard/settings/changePassword/ChangePassword.dart';
import 'package:stackclicks_flutter/views/dashboard/settings/changeBankDetails/ChangeBankDetails.dart';

final routes = <String, WidgetBuilder> {
  "/": (context) => Home(),
  "/sign_in": (context) => SignIn(),
  "/sign_up": (context) => SignUp(),
  "/set_bank_details": (context) => SetBankDetails(),
  "/password_recovery": (context) => PasswordRecovery(),
  "/dashboard/home": (context) => dashboardHome.Home(),
  "/dashboard/settings": (context) => Settings(),
  "/dashboard/settings/change_password": (context) => ChangePassword(),
  "/dashboard/settings/change_bank_details": (context) => ChangeBankDetails(),
  "/dashboard/tasks": (context) => Tasks(),
  "/dashboard/transactions": (context) => Transactions()
};