import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/Transactions.dart';

import 'PaymentsWidgetView.dart';

class Payments extends StatefulWidget {
  final TransactionsStateController parentState;

  Payments(this.parentState);

  @override 
  createState() => PaymentsStateController();
}

class PaymentsStateController extends State<Payments> {
  final refreshController = RefreshController();
  int nextPage = 1;
  bool gettingPayments = false;

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  void onRefresh() async {
    setState(() {
      gettingPayments = true;
    });
    var response = await store.getPayments();
    setState(() {
      gettingPayments = false;
    });
    refreshController.refreshCompleted();
    if(response.status == 200) {
      if(!response.hasNextPage)
        refreshController.loadNoData();
      else nextPage = 2;
    }
  }

  void onLoading() async {
    var response = await store.getPayments(page: nextPage);
    refreshController.loadComplete();
    if(response.status == 200) {
      if(!response.hasNextPage)
        refreshController.loadNoData();
      else nextPage++;
    }
  }

  void gotoPay() async {
    widget.parentState.success = (await store.navigatorKey.currentState.pushNamed("/dashboard/transactions/pay") as String);
  }
  
  @override 
  Widget build(BuildContext context) => PaymentsWidgetView(this);
}