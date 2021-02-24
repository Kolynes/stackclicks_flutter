import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/withdrawalRequests/requestWithdrawal/RequestWithdrawalWidgetView.dart';

class RequestWithdrawal extends StatefulWidget {
  @override 
  createState() => RequestWithdrawalStateController();
}

class RequestWithdrawalStateController extends State<RequestWithdrawal> {
  final requestWithdrawalFormKey = GlobalKey<FormState>();
  final amountFocusNode = FocusNode();
  final requestTypeFocusNode = FocusNode();

  TextEditingController selectTypeController = TextEditingController(text: "Balance");
  String amount = "", requestType = "Balance", error = "";
  bool requestingWithdrawal = false;


  set type(String value) {
    setState(() {
      requestType = value;
      selectTypeController = TextEditingController(text: value);
    });
  }

  @override 
  void initState() {
    amountFocusNode.requestFocus();
    super.initState();
  }

  String balanceValidator(String value) {
    if(requestType == "Balance" && double.parse(value) > store.user.balance)
      return "Maximum withdrawable is ${store.user.balance}";
    else if(double.parse(value) > store.user.referralBalance)
      return "Maximum withdrawable is ${store.user.referralBalance}";
    else return null;
  }

  void requestWithdrawal() async {
    if(requestWithdrawalFormKey.currentState.validate()) {
      setState(() {
        requestingWithdrawal = true;
      });
      var response = await store.requestWithdrawal(amount.trim(), requestType.trim());
      setState(() {
        requestingWithdrawal = false;
      });
      if(response.status == 201)
        store.navigatorKey.currentState.pop("Your request will be processed shortly");
      else setState(() => error = response.errors["summary"]);
    }
  }

  @override 
  Widget build(BuildContext context) => RequestWithdrawalWidgetView(this);
}