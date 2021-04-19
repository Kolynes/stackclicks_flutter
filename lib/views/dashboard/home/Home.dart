import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/settings.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/ScaffoldMessenger.dart';

import 'HomeWidgetView.dart';

class Home extends StatefulWidget {
  @override
  createState() => HomeStateController();
}

class HomeStateController extends State<Home> with ScaffoldMessenger<Home>{
  final refreshController = RefreshController();
  bool pinging = true, loadingMessage = true, loadingActivePayment = true;
  AdmobInterstitial interstitialAd;

  bool get currentTaskIsActive {
    if(store.task != null)
      if(store.task.completed)
        return false;
      else return true;
    return false;
  }

  @override 
  void initState() {
    interstitialAd = AdmobInterstitial(
      adUnitId: admobIds["interstitial"]["android"],
    );
    interstitialAd.load();
    onRefresh();
    super.initState();
  }

  void onRefresh() async {
    var response = await store.ping();
    setState(() {
      pinging = false;
    });
    if(response.status == 200){
      await store.getMessage();
      await store.getActivePayment();
    }
    else if(response.status != 500)
      store.navigatorKey.currentState.popUntil((route) => route.isFirst);
    setState(() {
      loadingMessage = false;
      loadingActivePayment = false;
    });
    refreshController.refreshCompleted();
  }

  void goTo(int page) {
    interstitialAd.show();
    if(page > 0)
      store.navigatorKey.currentState.pushNamed([
        "/dashboard/tasks",
        "/dashboard/transactions",
        "/dashboard/settings"
      ][page - 1]);
  }

  void gotoRequestWithdrawal() async {
    interstitialAd.show();
    success = (await store.navigatorKey.currentState.pushNamed("/dashboard/transactions/request_withdrawal") as String);
  }

  void gotoPay() async {
    interstitialAd.show();
    success = (await store.navigatorKey.currentState.pushNamed("/dashboard/transactions/pay") as String);
  }

  Future<bool> onWillPop() async {
    MinimizeApp.minimizeApp();
    return false;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
    child: HomeWidgetView(this),
    onWillPop: onWillPop
  );
}