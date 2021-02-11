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
  String bankName = "", accountName = "", accountNumber = "", error = "";
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
      });
      var response = await store.changeBankDetails(accountNumber, accountName, bankName);
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