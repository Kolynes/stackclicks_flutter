import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/store/Store.dart';

import 'TasksWidgetView.dart';

class Tasks extends StatefulWidget {
  @override 
  createState() => TasksStateController();
}

class TasksStateController extends State<Tasks> {
  bool gettingTask = true;
  String error = "";

  @override 
  void initState() {
    store.getTask().then((response) {
      setState(() {
        gettingTask = false;
      });
      if(response.status != 200)
        setState(() {
          error = response.errors["summary"];
        });
    });
    super.initState();
  }
  
  void completeTask() async {
    store.completeTask();
  }
  
  @override 
  Widget build(BuildContext context) => TasksWidgetView(this);
}