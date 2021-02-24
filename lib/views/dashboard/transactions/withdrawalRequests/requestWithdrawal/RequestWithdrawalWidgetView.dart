import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'package:stackclicks_flutter/utils/validators.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/withdrawalRequests/requestWithdrawal/RequestWithdrawal.dart';

class RequestWithdrawalWidgetView extends WidgetView<RequestWithdrawal, RequestWithdrawalStateController> {
  RequestWithdrawalWidgetView(RequestWithdrawalStateController state): super(state);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request Withdrawal"
        )
      ),
      body: ScrollablePage(
        child: Form(
          key: state.requestWithdrawalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PropertyChangeConsumer<Store>(
                properties: [ModuleProperties.accounts],
                builder: (context, store, snapshot) {
                  return state.requestType == "Balance" 
                    ?Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
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
                        ],
                      ),
                    )
                    :Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
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
                          )
                        ],
                      ),
                    );
                }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 18.0),
                child: Text("Fill in the form to request for a withdrawal"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Amount",
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      MdiIcons.numeric
                    ),
                  ),
                  focusNode: state.amountFocusNode,
                  validator: (value) => requiredValidator(value) ?? state.balanceValidator(value),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => state.amount = value,
                  onFieldSubmitted: (value) => state.requestTypeFocusNode.requestFocus(),
                ),
              ),
              PopupMenuButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Withdraw From",
                      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      prefixIcon: Icon(
                        state.requestType == "Balance"
                          ?MdiIcons.walletOutline
                          :MdiIcons.accountCashOutline
                      ),
                    ),
                    controller: state.selectTypeController,
                    enabled: false,
                  ),
                ),
                initialValue: "Balance",
                onSelected: (value) => state.type = value,
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: "Balance",
                    child: Text(
                      "Balance"
                    ),
                  ),
                  PopupMenuItem(
                    value: "Referral",
                    child: Text(
                      "Referral"
                    ),
                  ),
                ],
                offset: Offset(0, 70)
              ),
              state.error != ""
                ?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.error,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.red,
                    )
                  ),
                )
                :SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: state.requestingWithdrawal
                    ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                    :Icon(MdiIcons.arrowRight),
                  onPressed: state.requestWithdrawal
                ),
              ),
            ]
          )
        )
      )
    );
  }
}