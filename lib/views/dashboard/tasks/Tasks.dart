import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/settings.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/ScaffoldMessenger.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'TasksWidgetView.dart';

class Tasks extends StatefulWidget {
  @override 
  createState() => TasksStateController();
}

class TasksStateController extends State<Tasks> with ScaffoldMessenger<Tasks>{
  final refreshController = RefreshController();
  YoutubePlayerController youtubePlayerController;
  bool gettingTask = true;
  String error = "";
  AdmobInterstitial interstitialAd;

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
    var response = await store.getTask();
    setState(() {
      gettingTask = false;
    });
    if(response.status != 200)
      setState(() {
        error = response.errors["summary"];
      });
    else setState(() {
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: store.task.url,
      );
    });
    refreshController.refreshCompleted();
  }
  
  void completeTask(YoutubeMetaData metadata) async {
    var response = await store.completeTask();
    if(response.status == 200)
      store.ping();
  }

  void gotoPay() async {
    interstitialAd.show();
    success = (await store.navigatorKey.currentState.pushNamed("/dashboard/transactions/pay") as String);
  }
  
  @override 
  Widget build(BuildContext context) => TasksWidgetView(this);
}