import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'ChangeBankDetailsWidgetView.dart';

class ChangeBankDetails extends StatefulWidget {
  @override
  createState() => ChangeBankDetailsStateController();
}

class ChangeBankDetailsStateController extends State<ChangeBankDetails> {
  final bankNameFocusNode = FocusNode();
  final accountNameFocusNode = FocusNode();
  final accountNumberFocusNode = FocusNode();
  final changeBankDetailsFormKey = GlobalKey<FormState>();
  String bankName = store.user.bankName,
    accountName = store.user.accountName,
    accountNumber = store.user.accountNumber,
    error = "";
  bool changingBankDetails = false;

  @override
  void initState() {
    accountNumberFocusNode.requestFocus();
    super.initState();
  }

  void changeBankDetails() async {
    if(changeBankDetailsFormKey.currentState.validate()) {
      setState(() {
        changingBankDetails = true;
        error = "";
      });
      var response = await store.changeBankDetails(accountNumber.trim(), accountName.trim(), bankName.trim());
      setState(() {
        changingBankDetails = false;
      });
      if(response.status == 200)
        store.navigatorKey.currentState.pop("Bank details changed");
      else setState(() => error = response.errors["summary"]);
    }
  }

  @override
  Widget build(BuildContext context) => ChangeBankDetailsWidgetView(this);
}