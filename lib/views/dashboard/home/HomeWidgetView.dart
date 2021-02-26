import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/time.dart';

import 'Home.dart';

class HomeWidgetView extends WidgetView<Home, HomeStateController> {
  HomeWidgetView(HomeStateController state, {Key key}): super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: state.scaffoldKey,
      appBar: AppBar(
        leading: CircleAvatar(
          child: Image.asset(
            "lib/assets/images/logo.png",
            width: 30
          ),
          backgroundColor: Colors.white,
        ),
        title: Text(
          "Stackclicks",
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: Colors.black54
          )
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: state.pinging && store.user == null
        ?Center(
          child: Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
        )
      :PropertyChangeConsumer<Store>(
        properties: [ModuleProperties.accounts, ModuleProperties.messages, ModuleProperties.payments],
        builder: (context, store, snapshot) {
          return SmartRefresher(
            controller: state.refreshController,
            enablePullDown: true,
            onRefresh: state.onRefresh,
            child: ScrollablePage(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              MdiIcons.accountOutline
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.user.fullname
                                ),
                                Text(
                                  store.user.email,
                                  style: Theme.of(context).textTheme.caption
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20)
                              )
                            ),
                            child: FlatButton(
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Text("Settings"),
                              onPressed: () => state.goTo(3)
                            ),
                          ),
                        ],
                      )
                    )
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  MdiIcons.package,
                                  color: Colors.black54,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Active Package",
                                  ),
                                )
                              ],
                            ),
                          ),
                          store.activePayment != null
                            ?Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Text(
                                    store.activePayment.package[0].toUpperCase()
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${store.activePayment.package} Package"
                                      ),
                                      Text(
                                        "Bought ${when(store.activePayment.createdOn)}",
                                        style: Theme.of(context).textTheme.caption
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                            :Row(
                              children: [
                                Text(
                                  "No Active Package",
                                ),
                                Spacer(),
                                ButtonTheme(
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
                              ],
                            )
                        ],
                      )
                    )
                  ),
                  Center(
                    child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        )
                      ),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text("Check Today's Task"),
                        onPressed: () => state.goTo(1)
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.walletOutline,
                                color: Colors.black54
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Balance"
                                ),
                              )
                            ]
                          ),
                          SizedBox(
                            height: 70,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                "N ${store.user.balance.toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.green,
                                )
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.accountCashOutline,
                                color: Colors.black54
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Referral Balance"
                                ),
                              )
                            ]
                          ),
                          SizedBox(
                            height: 70,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                "N ${store.user.referralBalance.toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.green,
                                )
                              ),
                            ),
                          ),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20)
                              )
                            ),
                            child: FlatButton(
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Text("Request Withdrawal"),
                              onPressed: state.gotoRequestWithdrawal
                            ),
                          ),

                        ]
                      )
                    )
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.accountSupervisorOutline,
                                color: Colors.black54
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Referrals"
                                ),
                              )
                            ]
                          ),
                          SizedBox(
                            height: 70,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                store.user.referralCount.toString(),
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Theme.of(context).accentColor
                                )
                              ),
                            ),
                          ),
                          Text(
                            "Referral Code",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                              ),
                              readOnly: true,
                              initialValue: store.user.referralCode
                            ),
                          ),
                        ]
                      )
                    )
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.messageOutline,
                                color: Colors.white38
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Admin Message",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ]
                          ),
                          state.loadingMessage
                            ?Center(
                              child: Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                            )
                            :store.message != null
                              ?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                    child: Text(
                                      when(store.message.createdOn),
                                      style: Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.white
                                      )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                    child: Text(
                                      store.message.message,
                                      style: TextStyle(
                                        color: Colors.white
                                      )
                                    ),
                                  )
                                ],
                              )
                              :Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      MdiIcons.messageOutline,
                                      size: 200,
                                      color: Colors.white38
                                    ),
                                    Text(
                                      "No Message found",
                                      style: TextStyle(
                                        color: Colors.white
                                      )
                                    )
                                  ],
                                ),
                              )
                        ],
                      ),
                    )
                  )
                ]
              )
            ),
          );
        }
      ),
      bottomNavigationBar: PropertyChangeConsumer<Store>(
        properties: [ModuleProperties.tasks],
        builder: (context, store, snapshot) {
          return BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.black54,
            showSelectedLabels: false,
            onTap: state.goTo,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  MdiIcons.homeOutline
                )
              ),
              BottomNavigationBarItem(
                label: "Tasks",
                icon: Badge(
                  badgeContent: Text(
                    "New",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                    )
                  ),
                  badgeColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(6),
                  position: BadgePosition(start: 12, bottom: 10),
                  showBadge: state.currentTaskIsActive,
                  child: Icon(
                    MdiIcons.formatListCheckbox
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Transactions",
                icon: Icon(
                  MdiIcons.walletOutline
                ),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(
                  MdiIcons.cogOutline
                ),
              )
            ],
          );
        }
      ),
    );
  }
}