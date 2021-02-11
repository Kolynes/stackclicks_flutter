import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'Tasks.dart';

class TasksWidgetView extends WidgetView<Tasks, TasksStateController> {
  TasksWidgetView(TasksStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return Container();
  }
}