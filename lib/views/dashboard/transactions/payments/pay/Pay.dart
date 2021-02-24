import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/payments/pay/PayWidgetView.dart';

class Pay extends StatefulWidget {

  @override 
  createState() => PayStateController();
}

class PayStateController extends State<Pay> {
  final couponFocusNode = FocusNode();
  final couponFormKey = GlobalKey<FormState>();

  String coupon = "", error = "";
  bool paying = false;

  @override 
  void initState() {
    couponFocusNode.requestFocus();
    super.initState();
  }

  void pay() async {
    if(couponFormKey.currentState.validate()) {
      setState(() {
        paying = true;
      });
      var response = await store.pay(coupon);
      setState(() {
        paying = false;
      });
      if(response.status == 201)
        store.navigatorKey.currentState.pop("Paid successfully");
      else setState(() => error = response.errors["summary"]);
    }
  }
  
  @override 
  Widget build(BuildContext context) => PayWidgetView(this);
}