import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/time.dart';
import 'WithdrawalRequests.dart';

class WithdrawalRequestsWidgetView extends WidgetView<WithdrawalRequests, WithdrawalRequestsStateController> {
  WithdrawalRequestsWidgetView(WithdrawalRequestsStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return PropertyChangeConsumer<Store>(
      properties: [ModuleProperties.withdrawalRequests],
      builder: (context, store, properties) {
        return Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment(-1, -1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20)
                      )
                    ),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      child: state.addingWithdrawalRequest
                        ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)))
                        :Text("Request Withdrawal"),
                      onPressed: state.gotoRequestWithdrawal
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: state.refreshController,
                  onRefresh: state.onRefresh,
                  onLoading: state.onLoading,
                  child: (store.withdrawalRequests ?? []).length == 0
                    ?Center(
                      child: state.gettingWithdrawalRequests
                        ?Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                        :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.walletOutline,
                              size: 200,
                              color: Colors.black38
                            ),
                            Text(
                              "No withdrawals found"
                            )
                          ],
                        )
                    )
                    :ListView.builder(
                      itemCount: store.withdrawalRequests.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  store.withdrawalRequests[index].type == "Balance"
                                    ?MdiIcons.walletOutline
                                    :MdiIcons.accountCashOutline
                                ),
                              ],
                            ),
                            title: Row(
                              children: [
                                Text(
                                  "From ${store.withdrawalRequests[index].type}",
                                  style: Theme.of(context).textTheme.caption
                                ),
                              ],
                            ),
                            subtitle: Text(
                              store.withdrawalRequests[index].amount.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                color: store.withdrawalRequests[index].status == "Pending"
                                  ?Colors.red
                                  :Colors.green
                              )
                            ),
                            trailing: Container(
                              child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  store.withdrawalRequests[index].status == "Pending"
                                    ?Icon(
                                      MdiIcons.record,
                                      color: Colors.red
                                    )
                                    :Icon(
                                      MdiIcons.check,
                                      color: Colors.green
                                    ),
                                    Text(
                                      when(store.withdrawalRequests[index].createdOn),
                                      style: Theme.of(context).textTheme.caption
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            indent: 70,
                          )
                        ],
                      )
                    )
                ),
              ),
            ],
          )
        );
      }
    );
  }
}