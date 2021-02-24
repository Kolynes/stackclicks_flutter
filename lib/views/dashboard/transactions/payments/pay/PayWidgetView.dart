import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/utils/validators.dart';
import 'package:stackclicks_flutter/views/dashboard/transactions/payments/pay/Pay.dart';

class PayWidgetView extends WidgetView<Pay, PayStateController> {
  PayWidgetView(PayStateController state): super(state);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pay"
        ),
        elevation: 0
      ),
      body: ScrollablePage(
        child: Form(
          key: state.couponFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 8.0, right: 8.0),
                child: Text(
                  "Enter coupon code below"
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Coupon Code",
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      MdiIcons.numeric
                    ),
                  ),
                  focusNode: state.couponFocusNode,
                  validator: requiredLengthValidator(max:16, min: 16),
                  maxLength: 16,
                  keyboardType: TextInputType.numberWithOptions(),
                  onChanged: (value) => state.coupon = value,
                  onFieldSubmitted: (value) => state.pay(),
                ),
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
                  icon: state.paying
                    ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                    :Icon(MdiIcons.arrowRight),
                  onPressed: state.pay
                ),
              )
            ]
          ),
        )
      )
    );
  }
}