import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/settings.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Tasks.dart';

class TasksWidgetView extends WidgetView<Tasks, TasksStateController> {
  TasksWidgetView(TasksStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      key: state.scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Today's Task"
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SmartRefresher(
              controller: state.refreshController,
              enablePullDown: true,
              onRefresh: state.onRefresh,
              child: PropertyChangeConsumer<Store>(
                properties: [ModuleProperties.tasks, ModuleProperties.payments],
                builder: (context, store, properties) => store.activePayment == null
                  ?Container(
                    child: Center(
                      child: state.gettingTask
                        ?Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                        :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.package,
                              size: 200,
                              color: Colors.black38
                            ),
                            Text(
                              "No Active Package. Please pay for a package"
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ButtonTheme(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20)
                                    )
                                  ),
                                  child: FlatButton(
                                    textColor: Colors.white,
                                    color: Theme.of(context).primaryColor,
                                    child: Text("Pay"),
                                    onPressed: () => state.gotoPay()
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  )
                  :store.task == null
                    ?Container(
                      child: Center(
                        child: state.gettingTask
                          ?Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                          :Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.formatListCheckbox,
                                size: 200,
                                color: Colors.black38
                              ),
                              Text(
                                "No tasks available currently"
                              )
                            ],
                          )
                      ),
                    )
                    :ScrollablePage(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              store.task.title,
                              style: Theme.of(context).textTheme.headline4
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              store.task.completed
                                ?"Completed"
                                :"Active",
                              style: Theme.of(context).textTheme.caption
                            ),
                          ),
                          state.youtubePlayerController != null
                            ?YoutubePlayer(
                              controller: state.youtubePlayerController,
                              showVideoProgressIndicator: false,
                              onEnded: state.completeTask,
                            )
                            :Center(
                              child: Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              store.task.body,
                              style: Theme.of(context).textTheme.bodyText2
                            ),
                          )
                        ],
                      )
                    )
              ),
            ),
          ),
          AdmobBanner(adUnitId: admobIds["banner"]["android"], adSize: AdmobBannerSize.FULL_BANNER),
        ],
      )
    );
  }
}