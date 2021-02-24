import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'SetBankDetailsWidgetView.dart';

class SetBankDetails extends StatefulWidget {
  @override
  createState() => SetBankDetailsStateController();
}

class SetBankDetailsStateController extends State<SetBankDetails> {
  final bankNameFocusNode = FocusNode();
  final accountNameFocusNode = FocusNode();
  final accountNumberFocusNode = FocusNode();
  final setBankDetailsFormKey = GlobalKey<FormState>();
  String bankName = "", accountName = "", accountNumber = "", error = "";
  bool settingBankDetails = false;

  @override
  void initState() {
    accountNumberFocusNode.requestFocus();
    super.initState();
  }

  void setBankDetails() async {
    if(setBankDetailsFormKey.currentState.validate()) {
      setState(() {
        settingBankDetails = true;
        error = "";
      });
      var response = await store.changeBankDetails(accountNumber.trim(), accountName.trim(), bankName.trim());
      setState(() {
        settingBankDetails = false;
      });
      if(response.status == 200)
        store.navigatorKey.currentState.pushNamed("/dashboard/home");
      else setState(() => error = response.errors["summary"]);
    }
  }

  @override
  Widget build(BuildContext context) => SetBankDetailsWidgetView(this);
}