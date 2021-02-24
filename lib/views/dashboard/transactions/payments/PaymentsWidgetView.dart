import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/time.dart';
import 'Payments.dart';

class PaymentsWidgetView extends WidgetView<Payments, PaymentsStateController> {
  PaymentsWidgetView(PaymentsStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return PropertyChangeConsumer<Store>(
      properties: [ModuleProperties.payments],
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
                      child: Text("Pay"),
                      onPressed: state.gotoPay
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
                  child: (store.payments ?? []).length == 0
                    ?Center(
                      child: state.gettingPayments
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
                              "No Payments found"
                            )
                          ],
                        )
                    )
                    :ListView.builder(
                      itemCount: store.payments.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  MdiIcons.bankTransferOut
                                ),
                              ],
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${store.payments[index].package} Package"
                                ),
                                Text(
                                  store.payments[index].packagePrice.toStringAsFixed(2),
                                  style: Theme.of(context).textTheme.headline6
                                ),
                              ],
                            ),
                            trailing: Text(
                              when(store.payments[index].createdOn),
                              style: Theme.of(context).textTheme.caption
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