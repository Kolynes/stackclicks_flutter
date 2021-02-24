import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/models/VendorModel.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/Transactions.dart';
import 'package:url_launcher/url_launcher.dart';

import 'VendorsWidgetView.dart';

class Vendors extends StatefulWidget {
  final TransactionsStateController parentState;

  Vendors(this.parentState);
  
  @override 
  createState() => VendorsStateController();
}

class VendorsStateController extends State<Vendors> {
  final refreshController = RefreshController();
  int nextPage = 1;
  bool gettingVendors = false;

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  void onRefresh() async {
    setState(() {
      gettingVendors = true;
    });
    var response = await store.getVendors();
    setState(() {
      gettingVendors = false;
    });
    refreshController.refreshCompleted();
    if(response.status == 200) {
      if(!response.hasNextPage)
        refreshController.loadNoData();
      else nextPage = 2;
    }
  }

  void onLoading() async {
    var response = await store.getVendors(page: nextPage);
    refreshController.loadComplete();
    if(response.status == 200) {
      if(!response.hasNextPage)
        refreshController.loadNoData();
      else nextPage++;
    }
  }

  void goToVendor(VendorModel vendor) {
    launch(vendor.whatsappLink);
  }
  
  @override 
  Widget build(BuildContext context) => VendorsWidgetView(this);
}