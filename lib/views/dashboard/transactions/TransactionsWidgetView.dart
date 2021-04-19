import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/settings.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/payments/Payments.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/vendors/Vendors.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/withdrawalRequests/WithdrawalRequests.dart';
import 'Transactions.dart';

class TransactionsWidgetView extends WidgetView<Transactions, TransactionsStateController> {
  TransactionsWidgetView(TransactionsStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: state.scaffoldKey,
        appBar: AppBar(
          title: Text("Transactions"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(text: "Payments"),
              Tab(text: "Withdrawals"),
              Tab(text: "Vendors"),
            ]
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Payments(state),
                  WithdrawalRequests(state),
                  Vendors(state)
                ]
              ),
            ),
            AdmobBanner(adUnitId: admobIds["banner"]["android"], adSize: AdmobBannerSize.FULL_BANNER),
          ],
        )
      ),
    );
  }
}