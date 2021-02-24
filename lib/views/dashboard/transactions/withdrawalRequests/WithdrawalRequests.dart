import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/Transactions.dart';

import 'WithdrawalRequestsWidgetView.dart';

class WithdrawalRequests extends StatefulWidget {
  final TransactionsStateController parentState;

  WithdrawalRequests(this.parentState);

  @override 
  createState() => WithdrawalRequestsStateController();
}

class WithdrawalRequestsStateController extends State<WithdrawalRequests> {
  final refreshController = RefreshController();
  int nextPage = 1;
  bool gettingWithdrawalRequests = false, addingWithdrawalRequest = false;

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  void onRefresh() async {
    setState(() {
      gettingWithdrawalRequests = true;
    });
    var response = await store.getWithdrawalRequests();
    setState(() {
      gettingWithdrawalRequests = false;
    });
    refreshController.refreshCompleted();
    if(response.status == 200) {
      if(!response.hasNextPage)
        refreshController.loadNoData();
      else nextPage = 2;
    }
  }

  void onLoading() async {
    var response = await store.getWithdrawalRequests(page: nextPage);
    refreshController.loadComplete();
    if(response.status == 200) {
      if(!response.hasNextPage)
        refreshController.loadNoData();
      else nextPage++;
    }
  }

  void gotoRequestWithdrawal() async {
    widget.parentState.success = (await store.navigatorKey.currentState.pushNamed("/dashboard/transactions/request_withdrawal") as String);
  }

  @override 
  Widget build(BuildContext context) => WithdrawalRequestsWidgetView(this);
}